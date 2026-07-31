# BON CAKE 界面优化计划

> 状态：阶段 A 代码已落地（待浏览器验收）· 范围：用户端为主，管理端为辅 · 原则：不改后端业务，先修转化再重建门面  
> 审计日期：2026-07-31 · 技术栈：JSP + Bootstrap 3 + jQuery（Tomcat Docker）

---

## 1. 目标与原则

### 1.1 目标

在保留现有业务与部署方式的前提下，让商城界面：

1. **可用**：搜索、加购、购买、结算链路无死链/坏控件  
2. **可读**：品牌第一屏清晰，商品信息层次正常  
3. **可适配**：桌面与移动端均可浏览与完成下单  
4. **可维护**：样式收敛、少 inline、少重复 CSS  

### 1.2 原则

| 做 | 不做（本阶段） |
|----|----------------|
| 修交互缺陷与布局结构 | 整站迁 React / Vue |
| 保留 BON CAKE 金色品牌色 | 升级 Bootstrap 5（类名冲突大） |
| CSS 覆盖 + 局部 JSP 调整 | 为好看堆卡片阴影 / 紫渐变 / 胶囊标签 |
| 分阶段交付，可随时停 | Hero 上叠浮动徽章、统计条 |

### 1.3 设计方向（简述）

- **色**：Primary `#D3B145`；Ink `#1A1A1A`；Mute `#6B6B6B`；Line `#E8E4DC`；Surface `#FAF8F5` / `#F3F2F1`
- **字**：正文系统黑体栈可保留；标题可引入一组展示字体（思源宋 / Playfair 等），避免默认 Inter/Roboto 套路
- **布局**：内容最大宽约 1200px，左右流式 padding；禁止继续用 `width:1260px` + 绝对定位拼 Header
- **第一屏**：只放品牌、一句主张、一个主 CTA、一张全幅蛋糕图（轮播可保留为背景层）

---

## 2. 现状诊断摘要

| 维度 | 现状 |
|------|------|
| 品牌 | 金色体系与 BON CAKE 视觉有雏形 |
| 布局 | Header 固定约 1260px + absolute；大量 `style=` |
| 响应式 | 主站多数页无 `viewport`；自定义 CSS 几乎无移动适配 |
| 转化 | 搜索按钮非 submit；详情「立即购买」死链；列表购买=加购 |
| 资源 | Header 城市图标依赖 `boncake.com.cn` 外链 |
| 样式 | `index.css` 与 `head_footer.css` 大量重复 |
| 后台 | 欢迎页空白，仍是早期管理壳 |

---

## 3. 问题清单（按优先级）

### P0 — 阻断体验（必须先修）

| ID | 问题 | 位置 | 动作 |
|----|------|------|------|
| P0-1 | 主站无 viewport；Header 固定宽绝对定位 | 首页/列表/详情/购物车等 | 全站加 viewport；Header 改 flex/流式 |
| P0-2 | 搜索按钮是 `<span>`，无法真正提交 | `index.jsp`、`cakelist.jsp` | 改为 `<button type="submit">` |
| P0-3 | 详情「立即购买」`href="#"` | `cakedetails.jsp` | 加购并跳转结算，或直跳购物车 |
| P0-4 | 列表「立即购买」与「加入购物车」同一逻辑 | `cakelist.jsp` | 购买=加购+跳结算；加购=仅加车 |
| P0-5 | 购物车数量 `+/-` 绑定疑似反了 | `cart.jsp` + 相关 JS | 核对 `addval` / `cutval` |
| P0-6 | 错误用 `alert()`；HTML 拼写错误 | 登录等多页 | 页内错误条；修 `container-fullid`、`minheight`、`magrin-right` 等 |

### P1 — 转化与品牌

| ID | 问题 | 位置 | 动作 |
|----|------|------|------|
| P1-1 | Hero 仅轮播，无品牌文案与 CTA | `index.jsp` | 全幅 Hero + 主张 + 主 CTA |
| P1-2 | 商品卡：超大标题、多重 hr、边框堆叠 | 列表/首页 | 图主导、字阶收敛、去多余分割线 |
| P1-3 | 分类下拉 `top:550px` 等绝对像素 | 首页/列表 CSS | 相对父级定位 + 点击外部关闭 |
| P1-4 | 页脚链接重复/失效；外链 CDN | `footer.jsp`、`header.jsp` | 本地化资源；修或隐藏死链 |
| P1-5 | 城市选择器无配送业务 | `header.jsp` | 有业务则接入；否则简化去掉 |
| P1-6 | CSS 重复 | `css/cake/*` | 抽 `tokens.css` + 单入口 layout |
| P1-7 | 结算无步骤指示；后台欢迎页空 | `conorder.jsp`、admin | 结账进度条；后台简要仪表盘 |
| P1-8 | 登录页无氛围、表单偏挤 | `login.jsp` / `reg.jsp` | 半屏品牌区 + 表单；行内校验 |

### P2 — 体验增强

| ID | 问题 | 动作 |
|----|------|------|
| P2-1 | 中英双语导航密度高 | 默认中文；英文弱化或去掉 |
| P2-2 | 无空状态 / 加载反馈 | 推荐区、空购物车引导 |
| P2-3 | 无障碍不足 | 语义标签、焦点环、alt、对比度 |
| P2-4 | 动效缺失 | Hero 淡入、商品卡 hover 等 2–3 处 |
| P2-5 | 管理端早期 frames 风格 | 统一侧栏顶栏；表格密度与筛选 |

---

## 4. 分阶段实施计划

### 阶段 A · 修转化（建议 1–3 天）

**目标**：关键链路可走通，移动端至少可缩放浏览。

**任务清单**

- [x] A1 用户端关键 JSP `<head>` 增加  
      `<meta name="viewport" content="width=device-width, initial-scale=1">`
- [x] A2 修复搜索表单提交（`index.jsp`、`cakelist.jsp`）
- [x] A3 修复详情「立即购买」（`cakedetails.jsp`）
- [x] A4 列表购买 / 加购职责分离（`cakelist.jsp` + `addcart.js` 如需）
- [x] A5 核对并修复购物车数量步进（`cart.jsp`）
- [x] A6 登录/注册：`alert` → 页内提示条
- [x] A7 去掉 `boncake.com.cn` 外链图标，改本地 `images/cake/`
- [x] A8 页脚去重死链；修正明显 HTML/CSS 拼写错误
- [x] A9 Header 最小改动：去掉致命 absolute 溢出（可为阶段 B 铺垫）

**主要改动文件**

```
cake_shop/WebContent/jsp/cake/header.jsp
cake_shop/WebContent/jsp/cake/footer.jsp
cake_shop/WebContent/jsp/cake/index.jsp
cake_shop/WebContent/jsp/cake/cakelist.jsp
cake_shop/WebContent/jsp/cake/cakedetails.jsp
cake_shop/WebContent/jsp/cake/cart.jsp
cake_shop/WebContent/jsp/cake/login.jsp
cake_shop/WebContent/jsp/cake/reg.jsp
cake_shop/WebContent/js/cake/addcart.js
```

**验收**

- [ ] 搜索能出结果（代码已改，待 Docker/浏览器确认）  
- [ ] 列表加购成功且角标更新  
- [ ] 「立即购买」能进入购物车或结算  
- [ ] 购物车加减数量方向正确（代码侧已核对：原逻辑正确，已重命名）  
- [ ] 手机浏览器打开首页不再横向严重裁切（至少可缩放）

---

### 阶段 B · 重建门面（建议 3–7 天）

**目标**：品牌第一屏可读；商品与结账视觉统一。

**任务清单**

- [ ] B1 新建 `css/cake/tokens.css`（色板、字号、间距变量）
- [ ] B2 新建或收敛 `css/cake/layout.css`；Header/Footer 只引一份公共样式
- [ ] B3 Header 改为 flex + sticky；导航 / 账户 / 购物车对齐
- [ ] B4 首页 Hero：全幅图 + 品牌名 + 一句主张 + CTA（如「选购蛋糕」→ 商品列表）
- [ ] B5 首页/列表商品卡：统一图比例、名称 16–18px、价格强调、去掉多重 hr
- [ ] B6 分类下拉改为相对定位
- [ ] B7 登录/注册氛围布局
- [ ] B8 确认订单步骤条（地址 → 商品 → 支付 → 提交）
- [ ] B9 逐步清理 JSP 内重复 `<style>` 与关键 inline

**主要改动文件**

```
cake_shop/WebContent/css/cake/tokens.css          （新建）
cake_shop/WebContent/css/cake/layout.css          （新建或重构）
cake_shop/WebContent/css/cake/head_footer.css
cake_shop/WebContent/css/cake/index.css
cake_shop/WebContent/css/cake/cakelist.css
cake_shop/WebContent/css/cake/user_reg_login.css
cake_shop/WebContent/jsp/cake/index.jsp
cake_shop/WebContent/jsp/cake/conorder.jsp
cake_shop/WebContent/jsp/cake/login.jsp
cake_shop/WebContent/jsp/cake/header.jsp
```

**验收**

- [ ] 去掉导航后，第一屏仍能看出是 BON CAKE  
- [ ] 商品列表扫视：图 → 名 → 价 → 操作，无干扰分割线  
- [ ] 登录页与商城同属一套视觉语言  
- [ ] 结账页步骤位置清晰  

---

### 阶段 C · 体验打磨（建议 1–2 周）

**目标**：移动体验与后台达到可用齐平。

**任务清单**

- [ ] C1 断点适配：导航汉堡菜单；商品网格 2/3/4 列  
- [ ] C2 空购物车、无搜索结果、推荐加载中反馈  
- [ ] C3 加购轻反馈（保留现有 modal 或改为 toast）  
- [ ] C4 2–3 处有意义微动效（Hero 入场、商品 hover）  
- [ ] C5 管理端：统一壳层；首页展示订单/商品/用户摘要  
- [ ] C6 无障碍抽查：主流程键盘可达、主按钮对比度  

**主要改动文件**

```
cake_shop/WebContent/jsp/admin/*
cake_shop/WebContent/css/admin/*
cake_shop/WebContent/css/cake/*（media queries）
cake_shop/WebContent/js/cake/*
```

**验收**

- [ ] 375px 宽度可完成：浏览 → 加购 → 看购物车  
- [ ] 空状态有引导回列表  
- [ ] 管理端进入后不是纯欢迎语空白页  

---

## 5. 关键页面改造要点

| 页面 | 现状 | 目标 | 优先改 |
|------|------|------|--------|
| 首页 `index.jsp` | 轮播 + 分类按钮 + 双列表 | 品牌 Hero → 推荐 → 新品 | Hero、商品卡、分类定位 |
| 商品列表 `cakelist.jsp` | 大标题 + 多重分割 + 双同款按钮 | 筛选条 + 清晰网格 | 字阶、按钮职责、空结果 |
| 详情 `cakedetails.jsp` | 表格式信息堆叠 | 大图左 / 价+规格+主 CTA 右 | 主次按钮、服务文案精简 |
| 购物车 `cart.jsp` | 表 + 大 padding | 紧凑行 + 合计条 | 步进器、空车引导 |
| 确认订单 `conorder.jsp` | 区块堆叠无进度 | 四步结账 | 步骤指示、合计区 |
| 登录/注册 | 窄表单 + alert | 半屏品牌 + 表单 | 行内校验、主按钮金色 |
| 管理后台 | 欢迎文案 | 简要仪表盘 | 壳层统一、列表密度 |

---

## 6. 技术落地约定

1. **优先 CSS 覆盖**：在现有 Bootstrap 3 上叠加 tokens/layout，避免大面积重写类名。  
2. **公共头尾单一来源**：`header.jsp` / `footer.jsp` 引用统一 CSS，消灭 `index.css` 与 `head_footer.css` 双份 Header 规则。  
3. **图片本地化**：所有 UI 图标进 `WebContent/images/cake/`，禁止运行时依赖外站。  
4. **交互仍用 jQuery**：只修事件与 DOM，不引入新框架。  
5. **Docker 验证**：改完后 `docker compose up -d --build`，访问 `http://localhost:8080/` 走通验收清单。  

---

## 7. 建议执行顺序（操作指南）

```text
阶段 A 全部勾选并通过验收
    → 阶段 B（可按 B1→B3→B4→B5 顺序）
    → 阶段 C（移动优先，后台可并行）
```

每次只开一个阶段的 PR/提交主题，便于回滚与对照。

---

## 8. 文档与后续

| 产物 | 说明 |
|------|------|
| 本文档 | 执行与验收的单一事实来源 |
| Canvas（可选） | `cakeshop-uiux-plan.canvas.tsx` 可视化摘要 |
| 将来 skill（可选） | 把「审计 → P0/P1/P2 → 分阶段」封装为可复用流程；**当前不做** |

完成某一阶段后，在本节下方追加简短「变更记录」即可。

### 变更记录

| 日期 | 阶段 | 说明 |
|------|------|------|
| 2026-07-31 | — | 初稿：完整版优化计划落盘 |
| 2026-07-31 | A | 多 Agent 并行落地 A1–A9；待浏览器验收后勾选验收项 |
