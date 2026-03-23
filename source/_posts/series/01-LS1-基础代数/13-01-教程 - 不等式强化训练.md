---
title: "[教程] 13-不等式强化训练"
date: 2026-03-23 21:00:00
updated: 2026-03-23 21:00:00
tags: [LS-1, 教程，代数，不等式]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 25
---

## 📚 本章内容

本章综合训练不等式的各类问题：

### 1. 一元一次不等式
ax + b > 0

### 2. 一元二次不等式
ax² + bx + c > 0

### 3. 绝对值不等式
|x| < a ⟺ -a < x < a
|x| > a ⟺ x < -a 或 x > a

### 4. 分式不等式
f(x)/g(x) > 0 ⟺ f(x)·g(x) > 0

### 5. 不等式组
取各不等式解集的交集

---

## 💻 代码实现

```cpp
// 解一元一次不等式 ax + b > 0
string solve_linear(double a, double b) {
    if (abs(a) < 1e-9) {
        return b > 0 ? "全体实数" : "无解";
    }
    double x = -b / a;
    return a > 0 ? "x > " + to_string(x) : "x < " + to_string(x);
}

// 解一元二次不等式 ax² + bx + c > 0
string solve_quadratic(double a, double b, double c) {
    double delta = b * b - 4 * a * c;
    
    if (delta < 0) {
        return a > 0 ? "全体实数" : "无解";
    }
    
    double x1 = (-b - sqrt(delta)) / (2 * a);
    double x2 = (-b + sqrt(delta)) / (2 * a);
    
    if (a > 0) {
        return "x < " + to_string(x1) + " 或 x > " + to_string(x2);
    } else {
        return to_string(x1) + " < x < " + to_string(x2);
    }
}
```

---

## ✍️ 练习题

**习题 1**（⭐）解不等式：2x - 6 > 0

**习题 2**（⭐⭐）解不等式：x² - 4x + 3 < 0

**习题 3**（⭐⭐）解不等式：|x - 2| < 5

**习题 4**（⭐⭐⭐）解不等式组：x + 1 > 0 且 x - 3 < 0

**习题 5**（⭐⭐⭐）解不等式：(x-1)/(x-2) > 0

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 12-二次函数与一元二次方程  
**下一篇**: [教程] 14-三角函数的概念
