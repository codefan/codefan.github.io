---
title: "[教程] 15-诱导公式"
date: 2026-03-23 23:00:00
tags: [LS-1, 教程，代数，三角函数]
series: "信息竞赛数学教程"
series_order: 29
---

## 📚 诱导公式总结

### 公式记忆口诀

**奇变偶不变，符号看象限**

### 基本公式

| 角度 | sin | cos | tan |
|------|-----|-----|-----|
| π/2 - α | cos α | sin α | cot α |
| π/2 + α | cos α | -cos α | -cot α |
| π - α | sin α | -cos α | -tan α |
| π + α | -sin α | -cos α | tan α |
| 2π - α | -sin α | cos α | -tan α |
| -α | -sin α | cos α | -tan α |

---

## 💻 代码实现

```cpp
// 简化角度到 [0, 2π)
double normalize_angle(double angle) {
    angle = fmod(angle, 2 * M_PI);
    if (angle < 0) angle += 2 * M_PI;
    return angle;
}

// 利用诱导公式计算 sin
double sin_simplified(double angle) {
    angle = normalize_angle(angle);
    
    if (angle < M_PI / 2) {
        return sin(angle);  // 第一象限
    } else if (angle < M_PI) {
        return sin(M_PI - angle);  // 第二象限
    } else if (angle < 3 * M_PI / 2) {
        return -sin(angle - M_PI);  // 第三象限
    } else {
        return -sin(2 * M_PI - angle);  // 第四象限
    }
}
```

---

## ✍️ 练习题

**习题 1**（⭐）sin(150°) = ?

**习题 2**（⭐）cos(210°) = ?

**习题 3**（⭐⭐）tan(330°) = ?

**习题 4**（⭐⭐）化简：sin(π - α)

**习题 5**（⭐⭐⭐）证明：sin(π/2 - α) = cos α

**习题 6-10**：编程实现诱导公式

---

**上一篇**: [练习] 14-三角函数的概念  
**下一篇**: [练习] 15-诱导公式
