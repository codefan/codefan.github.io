---
title: "[教程] 07-零点与函数模型"
date: 2026-03-23 16:00:00
updated: 2026-03-23 16:00:00
tags: [LS-1, 教程，代数，函数，零点]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 13
---

## 🎮 情景引入

> 想象你在玩一个**弹道射击游戏**：
> 
> **场景**：你发射一枚炮弹，轨迹是抛物线
> ```
>      *
>    *   *
>   *     *
>  *       *
> *_________*____
> 发射点    落地点
> ```
> 
> **问题**：炮弹什么时候落地？
> 
> **数学模型**：
> - 高度 h(t) = -5t² + 20t（简化模型）
> - 落地时 h(t) = 0
> - 求 t 使得 h(t) = 0 → **求零点**
> 
> **解法**：
> ```
> -5t² + 20t = 0
> -5t(t - 4) = 0
> t = 0（发射点）或 t = 4（落地点）
> ```
> 
> **信竞中的应用**：零点是方程求解、二分查找、数值计算的核心！

---

## 📖 直观理解

### 1. 什么是函数的零点？

**零点**：函数图像与 x 轴交点的横坐标

{% mermaid %}
graph TD
    A[函数零点] --> B1["几何意义：与 x 轴交点"]
    A --> B2["代数意义：f(x) = 0 的解"]
    A --> B3["应用：方程求解"]
    
    B1 --> C1["图像穿过 x 轴"]
    B2 --> C2["解方程"]
    B3 --> C3["二分法、牛顿法"]
{% endmermaid %}


**示例**：
```
f(x) = x² - 4

零点：x = -2 和 x = 2

因为：f(-2) = 0, f(2) = 0

图像：
    y
    |     /‾‾\
    |    /    \
____|___/______\____ x
   -2  0       2
      零点！   零点！
```

### 2. 零点存在性定理

**定理**：如果函数 f(x) 在区间 [a, b] 上连续，且 f(a)·f(b) < 0（端点异号），则 f(x) 在 (a, b) 内至少有一个零点。

**直观理解**：
```
如果函数连续，且一端在 x 轴上方，一端在下方，
那么图像必须穿过 x 轴至少一次！

    y
    |  * f(a) > 0
    | /
    |/
____*_______ x
   /|
  / |
 *  |
f(b) < 0

中间必有零点！
```

### 3. 二分法求零点

**核心思想**：利用零点存在性定理，不断缩小区间

```
初始区间：[a, b]，f(a)·f(b) < 0

步骤：
1. 取中点 mid = (a + b) / 2
2. 如果 f(mid) = 0，找到零点
3. 如果 f(a)·f(mid) < 0，零点在 [a, mid]
4. 否则零点在 [mid, b]
5. 重复直到区间足够小

每次迭代，区间缩小一半！
```

**复杂度**：O(log n)

---

## 📐 数学定义

### 零点的定义

对于函数 y = f(x)，使 f(x) = 0 的实数 x 叫做函数的**零点**。

**等价关系**：
```
方程 f(x) = 0 有实数解
⇔ 函数 y = f(x) 有零点
⇔ 函数 y = f(x) 的图像与 x 轴有交点
```

### 零点存在性定理（介值定理的特例）

设函数 f(x) 在闭区间 [a, b] 上连续，且 f(a)·f(b) < 0，则至少存在一点 c ∈ (a, b)，使得 f(c) = 0。

**推论**：
- 如果 f(x) 在 [a, b] 上单调，则零点唯一
- 如果 f(a)·f(b) > 0，不能确定是否有零点

### 求零点的方法

**1. 代数法**（精确解）

适用于可因式分解的函数：

```
f(x) = x² - 5x + 6 = 0
(x - 2)(x - 3) = 0
x = 2 或 x = 3
```

**2. 公式法**（精确解）

一元二次方程 ax² + bx + c = 0：

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

**3. 二分法**（近似解）

适用于连续函数，已知零点所在区间。

**4. 牛顿法**（近似解，更快）

$$
x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}
$$

---

## 💻 代码实现

### 二分法求零点

```cpp
#include <bits/stdc++.h>
using namespace std;

// 示例函数：f(x) = x² - 4
double f(double x) {
    return x * x - 4;
}

// 二分法求零点
// 前提：f(left) * f(right) < 0
double bisection(double (*func)(double), double left, double right, 
                 double eps = 1e-7) {
    // 检查前提条件
    if (func(left) * func(right) > 0) {
        cerr << "端点同号，不能保证有零点！" << endl;
        return NAN;
    }
    
    while (right - left > eps) {
        double mid = left + (right - left) / 2;
        
        if (func(mid) == 0) {
            return mid;  // 精确零点
        }
        
        if (func(left) * func(mid) < 0) {
            right = mid;  // 零点在左半部分
        } else {
            left = mid;  // 零点在右半部分
        }
    }
    
    return left + (right - left) / 2;  // 返回中点
}

int main() {
    // 求 f(x) = x² - 4 在 [0, 5] 上的零点
    double zero = bisection(f, 0, 5);
    cout << "零点：x ≈ " << fixed << setprecision(6) << zero << endl;
    // 输出：x ≈ 2.000000
    
    return 0;
}
```

### 牛顿法求零点

```cpp
// 牛顿法求零点
// 需要函数值和导数值
double newton(double (*func)(double), double (*deriv)(double), 
              double x0, double eps = 1e-7, int max_iter = 100) {
    double x = x0;
    
    for (int i = 0; i < max_iter; i++) {
        double fx = func(x);
        
        if (abs(fx) < eps) {
            return x;  // 找到零点
        }
        
        double dfx = deriv(x);
        
        if (abs(dfx) < eps) {
            cerr << "导数为 0，牛顿法失败！" << endl;
            return NAN;
        }
        
        // 牛顿迭代公式
        x = x - fx / dfx;
    }
    
    cerr << "达到最大迭代次数，可能不收敛！" << endl;
    return x;
}

// 示例：f(x) = x² - 4, f'(x) = 2x
double f(double x) { return x * x - 4; }
double df(double x) { return 2 * x; }

int main() {
    // 从 x0 = 3 开始
    double zero = newton(f, df, 3);
    cout << "牛顿法零点：x ≈ " << zero << endl;
    // 输出：x ≈ 2.000000
    
    return 0;
}
```

### 一元二次方程求根

```cpp
// 一元二次方程求根公式
struct QuadraticRoots {
    bool has_real_roots;
    double x1, x2;
};

QuadraticRoots solve_quadratic(double a, double b, double c) {
    QuadraticRoots result;
    
    if (abs(a) < 1e-9) {
        // 退化为一次方程
        if (abs(b) < 1e-9) {
            result.has_real_roots = (abs(c) < 1e-9);  // 0 = 0
            result.x1 = result.x2 = 0;
        } else {
            result.has_real_roots = true;
            result.x1 = result.x2 = -c / b;
        }
        return result;
    }
    
    double delta = b * b - 4 * a * c;
    
    if (delta < 0) {
        result.has_real_roots = false;  // 无实根
    } else if (abs(delta) < 1e-9) {
        result.has_real_roots = true;
        result.x1 = result.x2 = -b / (2 * a);  // 重根
    } else {
        result.has_real_roots = true;
        double sqrt_delta = sqrt(delta);
        result.x1 = (-b + sqrt_delta) / (2 * a);
        result.x2 = (-b - sqrt_delta) / (2 * a);
    }
    
    return result;
}
```

---

## 🏆 信竞应用

### 1. 二分答案（零点思想的应用）

```cpp
// 二分答案的本质就是求零点
// 问题：求最小的 x，使得 f(x) >= target
// 转化为：求 g(x) = f(x) - target 的零点

bool check(double x) {
    // 判断 x 是否满足条件
    return x * x >= 4;  // 示例
}

double binary_search_answer(double left, double right, double eps = 1e-7) {
    while (right - left > eps) {
        double mid = left + (right - left) / 2;
        
        if (check(mid)) {
            right = mid;  // 尝试更小的值
        } else {
            left = mid;  // 需要更大的值
        }
    }
    
    return left;
}
```

### 2. 数值计算中的零点

```cpp
// 计算平方根（牛顿法）
double sqrt_newton(double n) {
    if (n < 0) return NAN;
    if (n == 0) return 0;
    
    double x = n;  // 初始猜测
    
    for (int i = 0; i < 100; i++) {
        double next_x = 0.5 * (x + n / x);
        if (abs(next_x - x) < 1e-9) break;
        x = next_x;
    }
    
    return x;
}

// 计算平方根（二分法）
double sqrt_bisection(double n) {
    if (n < 0) return NAN;
    if (n == 0) return 0;
    
    double left = 0, right = max(1.0, n);
    
    for (int i = 0; i < 100; i++) {
        double mid = left + (right - left) / 2;
        if (mid * mid >= n) {
            right = mid;
        } else {
            left = mid;
        }
    }
    
    return left;
}
```

### 3. 物理模拟中的零点

```cpp
// 抛体运动：求落地时间
// h(t) = h0 + v0*t - 0.5*g*t²

double gravity = 9.8;

double height(double t, double h0, double v0) {
    return h0 + v0 * t - 0.5 * gravity * t * t;
}

double height_deriv(double t, double h0, double v0) {
    return v0 - gravity * t;
}

// 求落地时间
double time_to_land(double h0, double v0) {
    // 二分法求零点
    double left = 0, right = 100;  // 假设 100 秒内落地
    
    // 确保端点异号
    while (height(right, h0, v0) > 0) {
        right *= 2;
    }
    
    return bisection(
        [h0, v0](double t) { return height(t, h0, v0); },
        left, right
    );
}
```

---

## 🔗 相关题目

> ⚠️ 以下题目为经典题型，具体题号请验证后使用

| 类型 | 题目名称 | 来源 | 难度 | 知识点 |
|------|---------|------|------|--------|
| 数学题 | 求函数零点 | 课本习题 | ⭐ | 零点定义 |
| 数学题 | 零点存在性判断 | 课本习题 | ⭐⭐ | 零点定理 |
| 编程题 | 二分法求根 | 洛谷 | ⭐⭐⭐ | 数值计算 |
| 编程题 | 牛顿法应用 | AtCoder | ⭐⭐⭐⭐ | 迭代法 |
| 编程题 | 二分答案 | Codeforces | ⭐⭐⭐ | 最优化 |
| 编程题 | 平方根计算 | 洛谷 | ⭐⭐ | 数值方法 |

---

## 📚 拓展阅读

### 进阶知识（选学）

1. **牛顿法的收敛性**
   - 局部收敛：初始值要靠近零点
   - 收敛速度：二阶收敛（比二分法快）

2. **割线法**
   - 不需要导数
   - 用差商代替导数

3. **多项式求根**
   - 三次、四次方程有求根公式
   - 五次及以上无一般求根公式（阿贝尔定理）

### 参考资料

- 《高中数学必修一》- 人教 A 版 - 第 3 章 函数
- 《数值分析》- 李庆扬 - 第 2 章 非线性方程求根
- [OI Wiki - 二分](https://oi-wiki.org/basic/binary/)

---

## 🔜 下一篇

[练习] 零点与函数模型应用

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 函数图像变换分析  
**下一篇**: [练习] 零点与函数模型应用
