---
title: "[教程] 10-对数运算与对数函数"
date: 2026-03-23 18:00:00
updated: 2026-03-23 18:00:00
tags: [LS-1, 教程，代数，对数函数]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 19
---

## 🎮 情景引入

> 想象你在玩一个**声音调节游戏**：
> 
> **场景**：声音强度每增加 10 分贝，人耳感觉"响一倍"
> ```
> 实际强度    分贝数
>    1          0 dB
>   10          10 dB
>  100          20 dB
> 1000          30 dB
> ```
> 
> **关系**：分贝数 = 10 × log₁₀(强度)
> 
> **反向问题**：60 dB 对应的实际强度是多少？
> ```
> 10 × log₁₀(I) = 60
> log₁₀(I) = 6
> I = 10⁶ = 1000000
> ```
> 
> **信竞中的应用**：对数在复杂度分析（O(log n)）、数值计算、密码学中无处不在！

---

## 📖 直观理解

### 1. 什么是对数？

**对数**是指数运算的**逆运算**

```
如果 a^x = N，那么 x = logₐ(N)

读作：x 等于"以 a 为底 N 的对数"
```

**示例**：
```
2³ = 8  ⟺  log₂(8) = 3
10² = 100  ⟺  log₁₀(100) = 2
e¹ = e  ⟺  ln(e) = 1
```

### 2. 常用对数与自然对数

| 名称 | 记法 | 底数 | 应用 |
|------|------|------|------|
| 常用对数 | log₁₀(x) 或 lg(x) | 10 | 工程计算 |
| 自然对数 | logₑ(x) 或 ln(x) | e≈2.718 | 微积分 |
| 二进制对数 | log₂(x) 或 lb(x) | 2 | 计算机科学 |

### 3. 对数函数

**对数函数**：f(x) = logₐ(x) (a > 0, a ≠ 1)

**图像特征**：
```
a > 1:          0 < a < 1:
    y               y
    |  \            |  /
    |   \           | /
    |    \          |/
____|_____\___ x____|_____\___ x
    |0              |0
```

**性质**：
- 定义域：(0, +∞)
- 值域：R
- 过定点：(1, 0)
- a > 1 时单调递增，0 < a < 1 时单调递减

---

## 📐 数学定义

### 对数运算法则

设 a > 0, a ≠ 1, M > 0, N > 0：

| 法则 | 公式 | 示例 |
|------|------|------|
| 乘法 | logₐ(MN) = logₐ(M) + logₐ(N) | log₂(8×4) = 3+2 = 5 |
| 除法 | logₐ(M/N) = logₐ(M) - logₐ(N) | log₂(8/4) = 3-2 = 1 |
| 幂 | logₐ(Mⁿ) = n·logₐ(M) | log₂(8²) = 2×3 = 6 |
| 换底公式 | logₐ(b) = logₖ(b) / logₖ(a) | log₂(3) = lg(3)/lg(2) |

### 重要恒等式

```
1. a^(logₐ(N)) = N
2. logₐ(a) = 1
3. logₐ(1) = 0
4. logₐ(aⁿ) = n
```

---

## 💻 代码实现

### 对数计算

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    // 自然对数
    cout << "ln(e) = " << log(M_E) << endl;  // 1.0
    
    // 常用对数
    cout << "lg(100) = " << log10(100) << endl;  // 2.0
    
    // 以 2 为底的对数
    cout << "lb(8) = " << log2(8) << endl;  // 3.0
    
    // 换底公式：logₐ(b) = ln(b) / ln(a)
    cout << "log₃(9) = " << log(9) / log(3) << endl;  // 2.0
    
    return 0;
}
```

### 对数在复杂度分析中的应用

```cpp
// O(log n) 的例子：二分查找

int binary_search(const vector<int>& nums, int target) {
    int left = 0, right = nums.size() - 1;
    int steps = 0;
    
    while (left <= right) {
        steps++;
        int mid = left + (right - left) / 2;
        
        if (nums[mid] == target) {
            cout << "找到目标，用了 " << steps << " 步" << endl;
            return mid;
        } else if (nums[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    cout << "未找到，用了 " << steps << " 步" << endl;
    return -1;
}

// 对于 n 个元素，最多需要 log₂(n) 步
// n = 1000 → log₂(1000) ≈ 10 步
// n = 1000000 → log₂(1000000) ≈ 20 步
```

### 对数优化乘法

```cpp
// 用对数将乘法转化为加法（避免溢出）
// log(a × b) = log(a) + log(b)

double log_multiply(double a, double b) {
    return exp(log(a) + log(b));
}

// 应用：计算多个大数的乘积
double product_of_large_numbers(const vector<double>& nums) {
    double log_sum = 0;
    for (double x : nums) {
        log_sum += log(x);
    }
    return exp(log_sum);
}
```

---

## 🏆 信竞应用

### 1. 时间复杂度分析

```
O(log n) - 对数时间
- 二分查找
- 快速幂
- 线段树操作
- 堆操作

O(n log n) - 线性对数时间
- 快速排序
- 归并排序
- 堆排序
```

### 2. 对数在数论中的应用

```cpp
// 计算 n! 的位数
// 位数 = floor(log₁₀(n!)) + 1
// log₁₀(n!) = log₁₀(1) + log₁₀(2) + ... + log₁₀(n)

int factorial_digits(int n) {
    double log_sum = 0;
    for (int i = 1; i <= n; i++) {
        log_sum += log10(i);
    }
    return floor(log_sum) + 1;
}

// 斯特林公式（近似）
// n! ≈ √(2πn) × (n/e)^n
int factorial_digits_stirling(int n) {
    if (n <= 1) return 1;
    double log_nfact = 0.5 * log10(2 * M_PI * n) + n * log10(n / M_E);
    return floor(log_nfact) + 1;
}
```

### 3. 快速幂的对数解释

```cpp
// 快速幂为什么是 O(log n)？
// 因为每次迭代，指数减半
// n → n/2 → n/4 → ... → 1
// 共 log₂(n) 步

// 示例：2^100
// 100 → 50 → 25 → 12 → 6 → 3 → 1
// 共 7 步（log₂(100) ≈ 6.64）
```

---

## 🔗 相关题目

> ⚠️ 以下题目为经典题型，具体题号请验证后使用

| 类型 | 题目名称 | 来源 | 难度 | 知识点 |
|------|---------|------|------|--------|
| 数学题 | 对数运算 | 课本习题 | ⭐ | 对数法则 |
| 数学题 | 对数函数图像 | 课本习题 | ⭐⭐ | 函数性质 |
| 编程题 | 二分查找 | 洛谷 | ⭐⭐ | O(log n) |
| 编程题 | 快速幂 | AtCoder | ⭐⭐ | 对数复杂度 |
| 编程题 | 阶乘位数 | Codeforces | ⭐⭐⭐ | 对数应用 |

---

## 📚 拓展阅读

### 进阶知识（选学）

1. **对数积分**
   - ∫(1/x)dx = ln|x| + C

2. **信息论中的对数**
   - 信息熵：H = -Σ pᵢ log₂(pᵢ)
   - 单位：比特

3. **离散对数问题**
   - 已知 a, b, p，求 x 使得 a^x ≡ b (mod p)
   - 密码学基础

### 参考资料

- 《高中数学必修一》- 人教 A 版
- 《算法竞赛入门经典》- 刘汝佳
- [OI Wiki - 复杂度分析](https://oi-wiki.org/basic/complexity/)

---

## 🔜 下一篇

[练习] 对数运算与对数函数

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 指数运算与指数函数  
**下一篇**: [练习] 对数运算与对数函数
