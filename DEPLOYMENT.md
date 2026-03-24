# 博客部署方案文档

> 我的码农生涯 - 博客系统部署方案与升级路径

---

## 📋 项目信息

| 项目 | 信息 |
|------|------|
| **博客名称** | 我的码农生涯 |
| **作者** | 杨淮生 |
| **GitHub** | https://github.com/codefan/codefan.github.io |
| **访问地址** | https://codefan.github.io |
| **创建日期** | 2026-03-18 |

---

## 🎯 方案演进路线

```
方案 B (当前)              方案 A (未来)
┌─────────────────┐      ┌─────────────────┐
│  Hexo 静态博客   │ ──►  │ Express 动态博客 │
│  GitHub Pages   │      │  Render/Railway │
│  完全免费       │      │  完整功能       │
│  2026-03-18     │      │  按需升级       │
└─────────────────┘      └─────────────────┘
```

---

## ✅ 方案 B：Hexo 静态博客（当前方案）

### 技术架构

```
┌─────────────────────────────────────────────────┐
│              本地开发环境                        │
│  Hexo + Markdown + 主题                         │
├─────────────────────────────────────────────────┤
│              部署流程                           │
│  hexo generate → hexo deploy → GitHub Pages    │
├─────────────────────────────────────────────────┤
│              访问端                             │
│  https://codefan.github.io                     │
└─────────────────────────────────────────────────┘
```

### 技术栈

| 组件 | 技术 | 版本 |
|------|------|------|
| **静态生成器** | Hexo | 7.x |
| **主题** | Landscape | 默认 |
| **托管平台** | GitHub Pages | - |
| **部署方式** | hexo-deployer-git | - |
| **成本** | 免费 | ¥0/月 |

### 目录结构

```
codefan.github.io/
├── _config.yml           # 站点配置
├── package.json          # 依赖配置
├── scaffolds/            # 文章模板
├── source/               # 源文件
│   ├── _posts/           # 博客文章
│   ├── about.md          # 关于页面
│   └── ...               # 其他页面
├── themes/               # 主题
└── public/               # 生成的静态文件（部署时）
```

### 工作流程

```bash
# 1. 创建新文章
hexo new post "文章标题"

# 2. 编辑文章
# 编辑 source/_posts/文章标题.md

# 3. 本地编译并部署（推荐）
hexo clean && hexo generate && hexo deploy
```

### 📌 部署策略（重要）

**部署模式**: 本地编译 → 直接提交到 GitHub master 分支

**部署流程**:
1. 在 `source` 分支维护源代码
2. 执行 `hexo generate` 本地编译生成静态文件到 `public/` 目录
3. 执行 `hexo deploy` 将 `public/` 内容提交到 GitHub 仓库的 `master` 分支
4. GitHub Pages 自动从 `master` 分支部署网站

**分支策略**:
- `source` 分支：Hexo 源代码（Markdown、配置、主题等）
- `master` 分支：编译后的静态文件（由 hexo deploy 自动管理）

**为什么不用 GitHub Actions 自动构建**:
- ✅ 本地编译更快速，无需等待 CI
- ✅ 可以在部署前预览生成的文件
- ✅ 减少 GitHub Actions 使用量
- ✅ 更直接的控制和调试能力

**配置位置** (`_config.yml`):
```yaml
deploy:
  type: git
  repo: git@github.com:codefan/codefan.github.io.git
  branch: master
```

### 优势

- ✅ **完全免费** - GitHub Pages 免费托管
- ✅ **速度快** - 静态 HTML，CDN 加速
- ✅ **无需维护** - 无需服务器、数据库
- ✅ **版本控制** - Git 管理所有内容
- ✅ **易于备份** - 代码即内容

### 限制

- ❌ **无后台管理** - 需本地写文章
- ❌ **无用户系统** - 无法登录注册
- ❌ **评论需第三方** - Disqus/utterances
- ❌ **动态功能受限** - 搜索、统计等需外部服务

### 已实现功能

- [x] 个人关于页面
- [x] 博客文章列表
- [x] 分类和标签
- [x] 代码高亮
- [x] 响应式设计
- [x] 自动部署

### 可添加功能（后续）

- [ ] 第三方评论系统（Disqus/utterances）
- [ ] 站内搜索（Algolia/本地搜索）
- [ ] 访问统计（Google Analytics/百度统计）
- [ ] RSS 订阅
- [ ] 自定义域名
- [ ] 更美观的主题

---

## 🚀 方案 A：Express 动态博客（未来升级方案）

### 触发升级的条件

考虑升级到方案 A 当需要以下功能时：

1. **需要后台管理系统** - 在线写文章、管理内容
2. **需要用户系统** - 注册、登录、权限管理
3. **需要完整评论系统** - 自建评论、审核管理
4. **需要付费功能** - 会员、打赏、付费内容
5. **需要实时功能** - 实时通知、聊天等
6. **需要复杂数据交互** - 表单、问卷等

### 技术架构

```
┌─────────────────────────────────────────────────┐
│              前端展示层                          │
│  EJS 模板 + Bootstrap 5 + highlight.js          │
├─────────────────────────────────────────────────┤
│              后端服务层                          │
│  Node.js + Express 5.x                          │
├─────────────────────────────────────────────────┤
│              数据存储层                          │
│  Prisma ORM + PostgreSQL (Prisma Postgres)      │
├─────────────────────────────────────────────────┤
│              部署平台                           │
│  Render.com (或 Railway)                        │
└─────────────────────────────────────────────────┘
```

### 技术栈对比

| 组件 | 方案 B (当前) | 方案 A (未来) |
|------|-------------|-------------|
| **框架** | Hexo | Express 5.x |
| **数据库** | 无 | PostgreSQL |
| **ORM** | 无 | Prisma |
| **模板** | EJS (Hexo) | EJS |
| **部署** | GitHub Pages | Render |
| **成本** | ¥0/月 | ¥0-50/月 |

### 数据迁移方案

#### 从 Hexo 迁移到 Express

```bash
# 1. 导出 Hexo 文章
source/_posts/*.md → 文章数据

# 2. 解析 Markdown 文件
title, date, tags, categories, content

# 3. 导入到 PostgreSQL
通过 Prisma 脚本批量插入

# 4. 迁移页面内容
about.md → 数据库页面表
```

#### 迁移脚本示例（未来）

```javascript
// scripts/migrate-from-hexo.js
const fs = require('fs');
const matter = require('gray-matter');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function migratePosts() {
  const posts = fs.readdirSync('source/_posts');
  
  for (const file of posts) {
    const content = fs.readFileSync(`source/_posts/${file}`, 'utf8');
    const { data, content: body } = matter(content);
    
    await prisma.post.create({
      data: {
        title: data.title,
        slug: file.replace('.md', ''),
        content: body,
        published: true,
        createdAt: data.date,
        tags: data.tags,
        categories: data.categories
      }
    });
  }
}
```

### 部署配置（未来）

#### Render 环境变量

```bash
# 服务配置
PORT=3000
NODE_ENV=production

# 数据库
DATABASE_URL=postgresql://...

# 管理员
ADMIN_USER=admin
ADMIN_PASS=你的密码

# Session
SESSION_SECRET=你的密钥
```

#### Render 部署步骤

1. 创建 Web Service
2. 连接 GitHub 仓库
3. 配置环境变量
4. 设置构建命令：`npm install && npx prisma migrate deploy`
5. 设置启动命令：`npm start`
6. 部署完成

### 成本预估

| 服务 | 免费额度 | 付费方案 | 说明 |
|------|---------|---------|------|
| **Render** | 750 小时/月 | $7/月起 | 免费会休眠 |
| **Prisma Postgres** | 1GB | $9/月起 | 免费 30 天后过期 |
| **总计** | ¥0/月 | ¥50-100/月 | 按需升级 |

---

## 🔄 方案对比总结

| 维度 | 方案 B (Hexo) | 方案 A (Express) |
|------|-------------|----------------|
| **成本** | 完全免费 | ¥50-100/月 |
| **部署难度** | 简单 | 中等 |
| **维护成本** | 低 | 中等 |
| **写文章方式** | 本地 Markdown | 后台在线编辑 |
| **用户系统** | ❌ | ✅ |
| **评论系统** | 第三方 | 自建 |
| **扩展性** | 有限 | 强 |
| **适合场景** | 个人写作 | 商业博客/多用户 |

---

## 📝 决策记录

### 2026-03-18 - 选择方案 B

**决策人**: 杨淮生

**选择理由**:
1. 初期需求简单，主要是个人写作和分享
2. 希望零成本启动
3. 不介意本地写文章
4. 暂时不需要用户系统和在线管理

**保留选项**:
- 未来如需要更复杂功能，可升级到方案 A
- Hexo 的 Markdown 文章可迁移到 Express

---

## 🔮 未来升级检查清单

当以下需求出现时，考虑升级到方案 A：

- [ ] 需要在线写文章（不想本地操作）
- [ ] 需要用户注册/登录功能
- [ ] 需要自建评论系统
- [ ] 需要付费内容/会员功能
- [ ] 需要实时通知功能
- [ ] 需要复杂的数据交互
- [ ] 博客流量增长，需要更好的性能优化

---

## 📚 相关资源

### Hexo 资源
- 官方文档：https://hexo.io/
- 主题列表：https://hexo.io/themes/
- 插件列表：https://hexo.io/plugins/

### Express 资源
- 官方文档：https://expressjs.com/
- Prisma 文档：https://www.prisma.io/
- Render 文档：https://render.com/docs

### 部署平台
- GitHub Pages：https://pages.github.com/
- Render：https://render.com/
- Railway：https://railway.app/

---

*文档最后更新：2026-03-18*
*作者：杨淮生*
