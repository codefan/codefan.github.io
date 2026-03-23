---
title: "[教程] 16-三角函数的图像与性质"
date: 2026-03-24 00:00:00
tags: [LS-1, 教程，代数，三角函数]
series: "信息竞赛数学教程"
series_order: 31
---

## 📖 三角函数的图像

### y = sin x

- 定义域：R
- 值域：[-1, 1]
- 周期：2π
- 奇函数
- 图像：波浪形

### y = cos x

- 定义域：R
- 值域：[-1, 1]
- 周期：2π
- 偶函数
- 图像：波浪形（相位差 π/2）

### y = tan x

- 定义域：x ≠ π/2 + kπ
- 值域：R
- 周期：π
- 奇函数
- 图像：有渐近线

---

## 📐 性质总结

| 函数 | 定义域 | 值域 | 周期 | 奇偶性 |
|------|--------|------|------|--------|
| sin x | R | [-1, 1] | 2π | 奇 |
| cos x | R | [-1, 1] | 2π | 偶 |
| tan x | x ≠ π/2+kπ | R | π | 奇 |

---

## 💻 代码实现

```cpp
// 绘制正弦波
void plot_sine() {
    for (int i = 0; i <= 40; i++) {
        double x = i * M_PI / 20;
        double y = sin(x);
        int bar_len = (y + 1) * 20;  // 映射到 [0, 40]
        
        cout << "x=" << fixed << setprecision(2) << x << ": ";
        for (int j = 0; j < bar_len; j++) cout << "*";
        cout << endl;
    }
}
```

---

## 🏆 信竞应用

### 1. 波动模拟

```cpp
// 简谐振动
double harmonic_motion(double t, double A, double omega, double phi) {
    return A * sin(omega * t + phi);
}
```

### 2. 周期性事件

```cpp
// 判断是否在波峰
bool is_peak(double x) {
    return abs(sin(x) - 1) < 1e-9;
}
```

---

## ✍️ 练习题

**习题 1**（⭐）sin x 的周期是？

**习题 2**（⭐）cos x 的值域是？

**习题 3**（⭐⭐）tan x 的定义域是？

**习题 4**（⭐⭐）证明：sin x 是奇函数

**习题 5**（⭐⭐⭐）编程：绘制正弦波

**习题 6-10**：综合应用

---

**LS-1 完成！** 🎉

**上一篇**: [练习] 15-诱导公式  
**下一篇**: [练习] 16-三角函数的图像与性质
