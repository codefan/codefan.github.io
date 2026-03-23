---
title: "[教程] 08-幂函数与对勾函数"
date: 2026-03-23 16:00:00
updated: 2026-03-23 16:00:00
tags: [LS-1, 教程，代数，函数，幂函数]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 15
---

## 🎮 情景引入

> 想象你在玩一个**城市建造游戏**：
> 
> **场景 1**：正方形地块的面积
> ```
> 边长：x
> 面积：A = x²
> 
> 边长翻倍 → 面积变 4 倍（平方增长）
> ```
> 
> **场景 2**：立方体仓库的体积
> ```
> 边长：x
> 体积：V = x³
> 
> 边长翻倍 → 体积变 8 倍（立方增长）
> ```
> 
> **场景 3**：建造围墙的成本优化
> ```
> 围一个面积为 A 的矩形场地
> 长：x，宽：A/x
> 周长：P = 2(x + A/x)
> 
> 这是"对勾函数"！有最小值！
> ```
> 
> **信竞中的应用**：幂函数在复杂度分析中无处不在，对勾函数用于最优化问题！

---

## 📖 直观理解

### 1. 幂函数的定义

**幂函数**：形如 f(x) = x^a 的函数，其中 a 是常数

<!-- mermaid 图表已移除，见下方描述 -->
graph TD
    A[幂函数 y = x^a] --> B1["a = 1: y = x 直线"]
    A --> B2["a = 2: y = x² 抛物线"]
    A --> B3["a = 3: y = x³ 立方曲线"]
    A --> B4["a = -1: y = 1/x 双曲线"]
    A --> B5["a = 1/2: y = √x 根号曲线"]


### 2. 常见幂函数的图像

```
y = x    y = x²   y = x³   y = x⁻¹   y = x^(1/2)
  /        ∪       /‾       |‾\      ‾/
 /        /      /         |  \    /
/        /      /          |   \  /
________/______/___________|____\/____
        /      /           |    \
       /      /            |     \
      ∪      ∪             |      \
```

### 3. 对勾函数

**对勾函数**：f(x) = x + a/x (a > 0)

**图像特征**：
```
    y
    |  ‾\
    |    \‾
    |     \
____|______\____ x
    |      /
    |    /
    |  /
    ∪
```

**关键性质**：
- 定义域：x ≠ 0
- 奇函数
- 最小值：当 x = √a 时，f(x) = 2√a

---

## 📐 数学定义

### 幂函数的性质

| a 的值 | 定义域 | 值域 | 奇偶性 | 单调性 |
|--------|--------|------|--------|--------|
| a > 0 | R | [0, +∞) | a 偶：偶<br>a 奇：奇 | [0, +∞) 递增 |
| a = 0 | R\{0} | {1} | 偶函数 | 常数 |
| a < 0 | R\{0} | R\{0} | a 偶：偶<br>a 奇：奇 | (0, +∞) 递减 |
| a = 1/2 | [0, +∞) | [0, +∞) | 非奇非偶 | 递增 |

### 对勾函数的性质

**函数**：f(x) = x + a/x (a > 0)

**定义域**：{x | x ≠ 0}

**值域**：(-∞, -2√a] ∪ [2√a, +∞)

**单调性**：
- 在 (-∞, -√a] 上：单调递增
- 在 [-√a, 0) 上：单调递减
- 在 (0, √a] 上：单调递减
- 在 [√a, +∞) 上：单调递增

**最值**：
- 最小值：f(√a) = 2√a
- 最大值：f(-√a) = -2√a

**证明**（基本不等式）：
```
当 x > 0 时：
x + a/x ≥ 2√(x · a/x) = 2√a

等号成立当且仅当 x = a/x，即 x = √a
```

---

## 💻 代码实现

### 幂函数计算

```cpp
#include <bits/stdc++.h>
using namespace std;

// 整数幂（快速幂）
long long power_int(long long x, int n) {
    if (n < 0) return 0;  // 整数域不支持负指数
    if (n == 0) return 1;
    
    long long result = 1;
    while (n > 0) {
        if (n & 1) result *= x;
        x *= x;
        n >>= 1;
    }
    return result;
}

// 浮点数幂
double power_double(double x, double a) {
    return pow(x, a);
}

// 分析幂函数的单调性
string analyze_power_function(double a) {
    if (a > 0) {
        return "在 [0, +∞) 上单调递增";
    } else if (a < 0) {
        return "在 (0, +∞) 上单调递减";
    } else {
        return "常数函数 f(x) = 1";
    }
}

int main() {
    cout << "2^10 = " << power_int(2, 10) << endl;  // 1024
    cout << "2^0.5 = " << power_double(2, 0.5) << endl;  // 1.414
    
    cout << analyze_power_function(2) << endl;  // 递增
    cout << analyze_power_function(-1) << endl;  // 递减
    
    return 0;
}
```

### 对勾函数最值

```cpp
// 对勾函数 f(x) = x + a/x 的最小值
double hook_function_min(double a) {
    // 最小值在 x = √a 处取得
    double x_optimal = sqrt(a);
    double min_value = x_optimal + a / x_optimal;
    return min_value;  // = 2√a
}

// 验证对勾函数性质
void verify_hook_function(double a) {
    cout << "对勾函数 f(x) = x + " << a << "/x" << endl;
    cout << "最小值点：x = " << sqrt(a) << endl;
    cout << "最小值：f(x) = " << hook_function_min(a) << endl;
    cout << "理论值：2√a = " << 2 * sqrt(a) << endl;
}

// 应用：矩形周长最小化
double min_perimeter(double area) {
    // 面积为 area，求最小周长
    // P = 2(x + area/x)，是对勾函数
    return 4 * sqrt(area);  // 正方形时周长最小
}
```

### 快速幂算法（信竞核心）

```cpp
// 快速幂（模意义下）
long long power_mod(long long base, long long exp, long long mod) {
    long long result = 1;
    base %= mod;
    
    while (exp > 0) {
        if (exp & 1) {
            result = result * base % mod;
        }
        base = base * base % mod;
        exp >>= 1;
    }
    
    return result;
}

// 应用：计算大数的幂
// 例如：2^1000000 mod (10^9 + 7)
int main() {
    long long mod = 1e9 + 7;
    cout << power_mod(2, 1000000, mod) << endl;
    
    return 0;
}
```

---

## 🏆 信竞应用

### 1. 时间复杂度分析

```
O(1)    - 常数时间
O(log n) - 对数时间（二分、快速幂）
O(n)    - 线性时间
O(n log n) - 线性对数（排序）
O(n²)   - 平方时间
O(n³)   - 立方时间
O(2^n)  - 指数时间
O(n!)   - 阶乘时间
```

### 2. 对勾函数在最优化中的应用

```cpp
// 问题：将 n 分成若干正整数的和，使乘积最大
// 结论：尽可能分成 3

int max_product(int n) {
    if (n <= 3) return n - 1;
    
    int quotient = n / 3;
    int remainder = n % 3;
    
    if (remainder == 0) {
        return power_mod(3, quotient, 1e9 + 7);
    } else if (remainder == 1) {
        return power_mod(3, quotient - 1, 1e9 + 7) * 4 % (1e9 + 7);
    } else {
        return power_mod(3, quotient, 1e9 + 7) * 2 % (1e9 + 7);
    }
}
```

### 3. 均值不等式的应用

```cpp
// 问题：x + y = S（定值），求 xy 的最大值
// 结论：x = y = S/2 时，xy 最大

double max_product_given_sum(double S) {
    return (S / 2) * (S / 2);  // 正方形面积最大
}

// 问题：xy = P（定值），求 x + y 的最小值
// 结论：x = y = √P 时，x + y 最小

double min_sum_given_product(double P) {
    return 2 * sqrt(P);  // 对勾函数最小值
}
```

---

## 🔗 相关题目

> ⚠️ 以下题目为经典题型，具体题号请验证后使用

| 类型 | 题目名称 | 来源 | 难度 | 知识点 |
|------|---------|------|------|--------|
| 数学题 | 幂函数性质 | 课本习题 | ⭐ | 幂函数 |
| 数学题 | 对勾函数最值 | 课本习题 | ⭐⭐⭐ | 基本不等式 |
| 编程题 | 快速幂 | 洛谷 | ⭐⭐ | 幂运算 |
| 编程题 | 最大乘积 | AtCoder | ⭐⭐⭐ | 对勾函数 |
| 编程题 | 均值不等式 | Codeforces | ⭐⭐⭐⭐ | 最优化 |

---

## 📚 拓展阅读

### 进阶知识（选学）

1. **广义幂函数**
   - y = x^a，a 可以是任意实数
   - 包括根式、倒数等

2. **对勾函数的推广**
   - f(x) = ax + b/x
   - 最小值：2√(ab)

3. **均值不等式**
   - 算术平均 ≥ 几何平均
   - (a+b)/2 ≥ √(ab)

### 参考资料

- 《高中数学必修一》- 人教 A 版
- 《算法竞赛入门经典》- 刘汝佳
- [OI Wiki - 快速幂](https://oi-wiki.org/math/binary-exponentiation/)

---

## 🔜 下一篇

[练习] 幂函数与对勾函数应用

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 零点与函数模型应用  
**下一篇**: [练习] 幂函数与对勾函数应用
