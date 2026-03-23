---
title: "[教程] 12-二次函数与一元二次方程"
date: 2026-03-23 20:00:00
updated: 2026-03-23 20:00:00
tags: [LS-1, 教程，代数，二次函数]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 23
---

## 🎮 情景引入

> 想象你在玩一个**弹道射击游戏**：
> 
> **场景**：炮弹的轨迹是抛物线
> ```
> 高度 h(t) = -5t² + 20t + 1.5
>          ↑    ↑   ↑
>       重力  初速 初始高度
> ```
> 
> **问题**：
> 1. 什么时候达到最高点？→ 顶点
> 2. 什么时候落地？→ 求根
> 3. 最大高度是多少？→ 最值
> 
> **信竞中的应用**：二次函数在物理模拟、最优化、动态规划中无处不在！

---

## 📖 二次函数的三种形式

### 1. 一般式
$$
f(x) = ax^2 + bx + c \quad (a \neq 0)
$$

### 2. 顶点式
$$
f(x) = a(x - h)^2 + k
$$
顶点：(h, k)

### 3. 交点式（有零点时）
$$
f(x) = a(x - x_1)(x - x_2)
$$
零点：x₁, x₂

---

## 📐 一元二次方程的求根公式

方程 ax² + bx + c = 0 (a ≠ 0) 的根：

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

**判别式** Δ = b² - 4ac：
- Δ > 0：两个不等实根
- Δ = 0：两个相等实根（重根）
- Δ < 0：无实根

---

## 💻 代码实现

```cpp
#include <bits/stdc++.h>
using namespace std;

struct QuadraticRoots {
    int type;  // 0: 无实根，1: 重根，2: 两不等实根
    double x1, x2;
};

QuadraticRoots solve_quadratic(double a, double b, double c) {
    QuadraticRoots result;
    
    double delta = b * b - 4 * a * c;
    
    if (delta < 0) {
        result.type = 0;  // 无实根
    } else if (abs(delta) < 1e-9) {
        result.type = 1;  // 重根
        result.x1 = result.x2 = -b / (2 * a);
    } else {
        result.type = 2;  // 两不等实根
        double sqrt_delta = sqrt(delta);
        result.x1 = (-b + sqrt_delta) / (2 * a);
        result.x2 = (-b - sqrt_delta) / (2 * a);
    }
    
    return result;
}

// 求顶点
pair<double, double> vertex(double a, double b, double c) {
    double h = -b / (2 * a);
    double k = a * h * h + b * h + c;
    return {h, k};
}

int main() {
    // 解方程 x² - 5x + 6 = 0
    auto roots = solve_quadratic(1, -5, 6);
    cout << "根：" << roots.x1 << ", " << roots.x2 << endl;  // 2, 3
    
    // 求顶点
    auto [h, k] = vertex(1, -5, 6);
    cout << "顶点：(" << h << ", " << k << ")" << endl;  // (2.5, -0.25)
    
    return 0;
}
```

---

## 🏆 信竞应用

### 1. 物理模拟

```cpp
// 抛体运动
double height(double t, double v0, double h0) {
    return h0 + v0 * t - 0.5 * 9.8 * t * t;
}

// 求落地时间
double time_to_land(double v0, double h0) {
    // 解方程：h0 + v0*t - 4.9*t² = 0
    auto roots = solve_quadratic(-4.9, v0, h0);
    return max(roots.x1, roots.x2);  // 取正根
}
```

### 2. 最优化问题

```cpp
// 求二次函数最值
double quadratic_optimize(double a, double b, double c) {
    auto [h, k] = vertex(a, b, c);
    return k;  // 顶点纵坐标
}
```

---

## 🔗 相关题目

| 类型 | 题目 | 难度 | 知识点 |
|------|------|------|--------|
| 数学题 | 求根公式 | ⭐ | 解方程 |
| 数学题 | 顶点坐标 | ⭐⭐ | 最值 |
| 编程题 | 物理模拟 | ⭐⭐⭐ | 抛物线 |
| 编程题 | 最优化 | ⭐⭐⭐ | 顶点 |

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 不等式性质与基本不等式  
**下一篇**: [练习] 二次函数与一元二次方程
