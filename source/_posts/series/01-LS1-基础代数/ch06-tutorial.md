---
title: "[教程] 06-函数的图像变换"
date: 2026-03-23 15:00:00
updated: 2026-03-23 15:00:00
tags: [LS-1, 教程，代数，函数，图像变换]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 11
---

## 🎮 情景引入

> 想象你在玩一个**2D 平台跳跃游戏**，主角站在原点 (0, 0)：
> 
> **场景 1**：主角向右移动 3 个单位
> ```
> 原位置：(0, 0)
> 新位置：(3, 0)
> 变换：x → x - 3（向右平移）
> ```
> 
> **场景 2**：主角跳起来，向上移动 2 个单位
> ```
> 原位置：(0, 0)
> 新位置：(0, 2)
> 变换：y → y - 2（向上平移）
> ```
> 
> **场景 3**：主角照镜子（左右翻转）
> ```
> 原位置：(2, 1)
> 镜像：(-2, 1)
> 变换：x → -x（关于 y 轴对称）
> ```
> 
> **场景 4**：主角变大 2 倍
> ```
> 原位置：(1, 1)
> 新位置：(2, 2)
> 变换：(x, y) → (2x, 2y)（放大）
> ```
> 
> **信竞中的应用**：图像变换在图形学、几何问题、坐标变换中无处不在！

---

## 📖 直观理解

### 1. 函数图像的四种基本变换

{% mermaid %}
graph TD
    A[图像变换] --> B1[平移变换]
    A --> B2[对称变换]
    A --> B3[伸缩变换]
    A --> B4[翻转变换]
    
    B1 --> C1["左右/上下移动"]
    B2 --> C2["关于轴/原点对称"]
    B3 --> C3["横向/纵向拉伸"]
    B4 --> C4["沿轴翻转"]
{% endmermaid %}


### 2. 平移变换

**左右平移**：
```
y = f(x) → y = f(x - a)

a > 0: 向右平移 a 个单位
a < 0: 向左平移 |a| 个单位

口诀：左加右减
```

**上下平移**：
```
y = f(x) → y = f(x) + b

b > 0: 向上平移 b 个单位
b < 0: 向下平移 |b| 个单位

口诀：上加下减
```

**示例**：
```
y = x²

y = (x - 2)²    → 向右平移 2 个单位
y = x² + 3      → 向上平移 3 个单位
y = (x - 2)² + 3 → 先右移 2，再上移 3
```

### 3. 对称变换

**关于 y 轴对称**：
```
y = f(x) → y = f(-x)

左右翻转
```

**关于 x 轴对称**：
```
y = f(x) → y = -f(x)

上下翻转
```

**关于原点对称**：
```
y = f(x) → y = -f(-x)

旋转 180°
```

**关于直线 y = x 对称**：
```
y = f(x) → x = f(y) 或 y = f⁻¹(x)

反函数
```

### 4. 伸缩变换

**横向伸缩**：
```
y = f(x) → y = f(ωx)

ω > 1: 横向压缩为原来的 1/ω
0 < ω < 1: 横向拉伸为原来的 1/ω
```

**纵向伸缩**：
```
y = f(x) → y = Af(x)

A > 1: 纵向拉伸为原来的 A 倍
0 < A < 1: 纵向压缩为原来的 A 倍
```

---

## 📐 数学定义

### 变换公式总结

| 变换类型 | 原函数 | 变换后 | 几何意义 |
|---------|--------|--------|---------|
| **左右平移** | y = f(x) | y = f(x - a) | 向右 (a>0) 或向左 (a<0) |
| **上下平移** | y = f(x) | y = f(x) + b | 向上 (b>0) 或向下 (b<0) |
| **y 轴对称** | y = f(x) | y = f(-x) | 左右翻转 |
| **x 轴对称** | y = f(x) | y = -f(x) | 上下翻转 |
| **原点对称** | y = f(x) | y = -f(-x) | 旋转 180° |
| **横向伸缩** | y = f(x) | y = f(ωx) | ω>1 压缩，0<ω<1 拉伸 |
| **纵向伸缩** | y = f(x) | y = Af(x) | A>1 拉伸，0<A<1 压缩 |

### 复合变换

多个变换可以**复合**，注意**顺序**：

```
y = f(x)

1. 向右平移 2：y = f(x - 2)
2. 向上平移 3：y = f(x - 2) + 3
3. 横向压缩 2 倍：y = f(2x - 2) + 3
4. 纵向拉伸 2 倍：y = 2f(2x - 2) + 3
```

**一般形式**：
$$
y = A \cdot f(\omega x + \phi) + h
$$

其中：
- A：纵向伸缩（A>1 拉伸，0<A<1 压缩）
- ω：横向伸缩（ω>1 压缩，0<ω<1 拉伸）
- φ：左右平移（φ>0 向左，φ<0 向右）
- h：上下平移（h>0 向上，h<0 向下）

---

## 💻 代码实现

### 坐标变换

```cpp
#include <bits/stdc++.h>
using namespace std;

// 点的结构
struct Point {
    double x, y;
};

// 函数示例：y = x²
double f(double x) {
    return x * x;
}

// 平移变换
Point translate(Point p, double dx, double dy) {
    return {p.x + dx, p.y + dy};
}

// 关于 y 轴对称
Point reflect_y(Point p) {
    return {-p.x, p.y};
}

// 关于 x 轴对称
Point reflect_x(Point p) {
    return {p.x, -p.y};
}

// 关于原点对称
Point reflect_origin(Point p) {
    return {-p.x, -p.y};
}

// 横向伸缩
Point scale_x(Point p, double omega) {
    return {p.x / omega, p.y};
}

// 纵向伸缩
Point scale_y(Point p, double A) {
    return {p.x, p.y * A};
}

// 复合变换：y = A * f(omega * x + phi) + h
Point transform(Point p, double A, double omega, double phi, double h) {
    double x_new = (p.x - phi) / omega;
    double y_new = A * f(omega * p.x + phi) + h;
    return {x_new, y_new};
}

int main() {
    Point p = {2, 4};  // y = x² 上的点
    
    // 向右平移 2，向上平移 3
    Point p1 = translate(p, 2, 3);
    cout << "平移后：(" << p1.x << ", " << p1.y << ")" << endl;
    
    // 关于 y 轴对称
    Point p2 = reflect_y(p);
    cout << "y 轴对称：(" << p2.x << ", " << p2.y << ")" << endl;
    
    // 纵向拉伸 2 倍
    Point p3 = scale_y(p, 2);
    cout << "纵向拉伸 2 倍：(" << p3.x << ", " << p3.y << ")" << endl;
    
    return 0;
}
```

### 绘制变换后的图像

```cpp
// 绘制函数图像的 ASCII 示意图
void plot_function(double (*func)(double), double x_min, double x_max, 
                   int width = 40, int height = 20) {
    vector<vector<char>> canvas(height, vector<char>(width, ' '));
    
    double x_step = (x_max - x_min) / (width - 1);
    double y_min = 0, y_max = 0;
    
    // 计算 y 范围
    for (int i = 0; i < width; i++) {
        double x = x_min + i * x_step;
        double y = func(x);
        if (i == 0 || y < y_min) y_min = y;
        if (i == 0 || y > y_max) y_max = y;
    }
    
    double y_step = (y_max - y_min) / (height - 1);
    
    // 绘制
    for (int i = 0; i < width; i++) {
        double x = x_min + i * x_step;
        double y = func(x);
        int row = height - 1 - (int)((y - y_min) / y_step * (height - 1));
        int col = i;
        if (row >= 0 && row < height && col >= 0 && col < width) {
            canvas[row][col] = '*';
        }
    }
    
    // 输出
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            cout << canvas[i][j];
        }
        cout << endl;
    }
}
```

---

## 🏆 信竞应用

### 1. 坐标变换在几何中的应用

```cpp
// 旋转坐标
Point rotate(Point p, double angle) {
    double rad = angle * M_PI / 180.0;
    double cos_a = cos(rad);
    double sin_a = sin(rad);
    
    return {
        p.x * cos_a - p.y * sin_a,
        p.x * sin_a + p.y * cos_a
    };
}

// 缩放坐标
Point scale(Point p, double sx, double sy) {
    return {p.x * sx, p.y * sy};
}
```

### 2. 二次函数图像变换

```cpp
// 二次函数顶点式：y = a(x - h)² + k
// 顶点：(h, k)
// 开口方向：a > 0 向上，a < 0 向下

struct Quadratic {
    double a, h, k;  // y = a(x - h)² + k
    
    double eval(double x) {
        return a * (x - h) * (x - h) + k;
    }
    
    // 从一般式转换
    static Quadratic from_general(double a, double b, double c) {
        double h = -b / (2 * a);
        double k = a * h * h + b * h + c;
        return {a, h, k};
    }
};
```

### 3. 三角函数图像变换

```cpp
// 正弦函数：y = A * sin(ωx + φ) + h
double sine_wave(double x, double A, double omega, double phi, double h) {
    return A * sin(omega * x + phi) + h;
}

// 参数含义：
// A: 振幅
// ω: 角频率（周期 T = 2π/ω）
// φ: 初相
// h: 垂直偏移
```

### 4. 分形图形（递归变换）

```cpp
// 科赫雪花的生成（递归 + 坐标变换）
void koch_curve(Point p1, Point p2, int depth) {
    if (depth == 0) {
        // 绘制线段 p1-p2
        return;
    }
    
    // 三等分点
    Point q1 = {(2 * p1.x + p2.x) / 3, (2 * p1.y + p2.y) / 3};
    Point q2 = {(p1.x + 2 * p2.x) / 3, (p1.y + 2 * p2.y) / 3};
    
    // 构造等边三角形的顶点
    double dx = q2.x - q1.x;
    double dy = q2.y - q1.y;
    Point peak = {
        (q1.x + q2.x) / 2 - dy * sqrt(3) / 2,
        (q1.y + q2.y) / 2 + dx * sqrt(3) / 2
    };
    
    // 递归
    koch_curve(p1, q1, depth - 1);
    koch_curve(q1, peak, depth - 1);
    koch_curve(peak, q2, depth - 1);
    koch_curve(q2, p2, depth - 1);
}
```

---

## 🔗 相关题目

> ⚠️ 以下题目为经典题型，具体题号请验证后使用

| 类型 | 题目名称 | 来源 | 难度 | 知识点 |
|------|---------|------|------|--------|
| 数学题 | 函数图像平移 | 课本习题 | ⭐ | 平移变换 |
| 数学题 | 函数图像对称 | 课本习题 | ⭐⭐ | 对称变换 |
| 编程题 | 坐标变换 | 洛谷 | ⭐⭐ | 几何变换 |
| 编程题 | 二次函数顶点 | AtCoder | ⭐⭐⭐ | 顶点式 |
| 编程题 | 三角函数图像 | Codeforces | ⭐⭐⭐⭐ | 正弦波 |
| 编程题 | 分形图形 | 洛谷 | ⭐⭐⭐⭐⭐ | 递归变换 |

---

## 📚 拓展阅读

### 进阶知识（选学）

1. **矩阵变换**
   - 平移、旋转、缩放都可以用矩阵表示
   - 计算机图形学的基础

2. **仿射变换**
   - 保持平行性的变换
   - 包括平移、旋转、缩放、剪切

3. **傅里叶变换**
   - 将函数分解为正弦波的叠加
   - 信号处理的核心工具

### 参考资料

- 《高中数学必修一》- 人教 A 版 - 第 3 章 函数
- 《算法竞赛入门经典》- 刘汝佳 - 第 4 章 几何
- [OI Wiki - 计算几何](https://oi-wiki.org/geometry/2d/)

---

## 🔜 下一篇

[练习] 函数图像变换分析

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 函数奇偶性判定  
**下一篇**: [练习] 函数图像变换分析
