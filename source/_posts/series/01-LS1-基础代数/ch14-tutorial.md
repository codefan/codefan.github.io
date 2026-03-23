---
title: "[教程] 14-三角函数的概念"
date: 2026-03-23 22:00:00
tags: [LS-1, 教程，代数，三角函数]
series: "信息竞赛数学教程"
series_order: 27
---

## 🎮 情景引入

> 想象你在玩一个**旋转游戏**：
> 
> 一个点绕原点旋转，坐标如何变化？
> ```
> 角度θ    x 坐标    y 坐标
>   0°      1         0
>  90°      0         1
> 180°     -1         0
> 270°      0        -1
> ```
> 
> 这就是三角函数：x = cos(θ), y = sin(θ)

---

## 📖 定义

### 单位圆定义

在单位圆上，角度θ对应的点坐标为 (cos θ, sin θ)

### 基本关系

- sin²θ + cos²θ = 1
- tan θ = sin θ / cos θ

### 特殊角的三角函数值

| θ | 0° | 30° | 45° | 60° | 90° |
|---|----|-----|-----|-----|-----|
| sin θ | 0 | 1/2 | √2/2 | √3/2 | 1 |
| cos θ | 1 | √3/2 | √2/2 | 1/2 | 0 |
| tan θ | 0 | √3/3 | 1 | √3 | 不存在 |

---

## 💻 代码实现

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    // 角度转弧度
    double deg = 45;
    double rad = deg * M_PI / 180.0;
    
    cout << "sin(45°) = " << sin(rad) << endl;  // 0.707
    cout << "cos(45°) = " << cos(rad) << endl;  // 0.707
    cout << "tan(45°) = " << tan(rad) << endl;  // 1.0
    
    // 弧度转角度
    double rad2 = M_PI / 3;
    double deg2 = rad2 * 180.0 / M_PI;
    cout << "π/3 = " << deg2 << "°" << endl;  // 60°
    
    return 0;
}
```

---

## 🏆 信竞应用

### 1. 坐标旋转

```cpp
struct Point {
    double x, y;
};

Point rotate(Point p, double angle) {
    double rad = angle * M_PI / 180.0;
    double cos_a = cos(rad);
    double sin_a = sin(rad);
    
    return {
        p.x * cos_a - p.y * sin_a,
        p.x * sin_a + p.y * cos_a
    };
}
```

### 2. 向量运算

```cpp
// 点积：a·b = |a||b|cos(θ)
double dot_product(Point a, Point b) {
    return a.x * b.x + a.y * b.y;
}

// 夹角
double angle_between(Point a, Point b) {
    double dot = dot_product(a, b);
    double mag_a = sqrt(a.x * a.x + a.y * a.y);
    double mag_b = sqrt(b.x * b.x + b.y * b.y);
    return acos(dot / (mag_a * mag_b));
}
```

---

## ✍️ 练习题

**习题 1**（⭐）sin(30°) = ?

**习题 2**（⭐）cos(60°) = ?

**习题 3**（⭐⭐）tan(45°) = ?

**习题 4**（⭐⭐）证明：sin²θ + cos²θ = 1

**习题 5**（⭐⭐⭐）编程：实现坐标旋转

**习题 6-10**：更多应用题

---

**上一篇**: [练习] 13-不等式强化训练  
**下一篇**: [练习] 14-三角函数的概念
