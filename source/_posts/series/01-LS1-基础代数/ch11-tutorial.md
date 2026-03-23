---
title: "[教程] 11-不等式性质与基本不等式"
date: 2026-03-23 19:00:00
updated: 2026-03-23 19:00:00
tags: [LS-1, 教程，代数，不等式]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 21
---

## 🎮 情景引入

> 想象你在玩一个**资源管理游戏**：
> 
> **场景 1**：背包容量限制
> ```
> 物品重量：w₁, w₂, ..., wₙ
> 背包容量：W
> 约束：w₁ + w₂ + ... + wₙ ≤ W
> ```
> 
> **场景 2**：建造时间的上下界
> ```
> 最快需要：10 分钟
> 最慢需要：30 分钟
> 时间范围：10 ≤ t ≤ 30
> ```
> 
> **场景 3**：资源分配优化
> ```
> 有 100 金币，要买攻击力和防御力
> 攻击力：a，防御力：d
> 约束：a + d ≤ 100
> 目标：最大化 a × d（乘积最大）
> 
> 答案：a = d = 50 时最大！（基本不等式）
> ```
> 
> **信竞中的应用**：不等式在约束条件、最优化、复杂度分析中无处不在！

---

## 📖 直观理解

### 1. 不等关系

**不等式**：表示两个量之间的大小关系

{% mermaid %}
graph TD
    A[不等式] --> B1[严格不等式]
    A --> B2[非严格不等式]
    
    B1 --> C1["a > b (大于)"]
    B1 --> C2["a < b (小于)"]
    B2 --> C3["a ≥ b (大于等于)"]
    B2 --> C4["a ≤ b (小于等于)"]
{% endmermaid %}


### 2. 基本不等式

**算术 - 几何均值不等式（AM-GM）**：

对于非负实数 a, b：
$$
\frac{a + b}{2} \geq \sqrt{ab}
$$

等号成立当且仅当 a = b。

**直观理解**：
```
周长固定的矩形中，正方形面积最大

周长 = 2(a + b) = 定值
面积 = a × b

当 a = b 时（正方形），面积最大！
```

### 3. 不等式的性质

| 性质 | 描述 | 示例 |
|------|------|------|
| 对称性 | a > b ⟺ b < a | 5 > 3 ⟺ 3 < 5 |
| 传递性 | a > b 且 b > c ⟹ a > c | 5 > 3 且 3 > 1 ⟹ 5 > 1 |
| 加法 | a > b ⟹ a + c > b + c | 5 > 3 ⟹ 5+2 > 3+2 |
| 乘法（正数） | a > b, c > 0 ⟹ ac > bc | 5 > 3, 2 > 0 ⟹ 10 > 6 |
| 乘法（负数） | a > b, c < 0 ⟹ ac < bc | 5 > 3, -2 < 0 ⟹ -10 < -6 |

---

## 📐 数学定义

### 不等式的基本性质

设 a, b, c ∈ R：

**1. 反对称性**
- 如果 a > b，则 b < a

**2. 传递性**
- 如果 a > b 且 b > c，则 a > c

**3. 加法单调性**
- 如果 a > b，则 a + c > b + c

**4. 乘法单调性**
- 如果 a > b 且 c > 0，则 ac > bc
- 如果 a > b 且 c < 0，则 ac < bc

**5. 同向不等式相加**
- 如果 a > b 且 c > d，则 a + c > b + d

**6. 同向正数不等式相乘**
- 如果 a > b > 0 且 c > d > 0，则 ac > bd

### 基本不等式（AM-GM）

**两个数的情况**：
$$
\frac{a + b}{2} \geq \sqrt{ab} \quad (a, b \geq 0)
$$

等号成立 ⟺ a = b。

**n 个数的情况**：
$$
\frac{a_1 + a_2 + \dots + a_n}{n} \geq \sqrt[n]{a_1 a_2 \dots a_n}
$$

等号成立 ⟺ a₁ = a₂ = ... = aₙ。

### 柯西 - 施瓦茨不等式

$$
(a_1^2 + a_2^2 + \dots + a_n^2)(b_1^2 + b_2^2 + \dots + b_n^2) \geq (a_1b_1 + a_2b_2 + \dots + a_nb_n)^2
$$

---

## 💻 代码实现

### 不等式验证

```cpp
#include <bits/stdc++.h>
using namespace std;

// 验证 AM-GM 不等式
bool verify_am_gm(double a, double b) {
    double arithmetic_mean = (a + b) / 2;
    double geometric_mean = sqrt(a * b);
    
    cout << "AM = " << arithmetic_mean << endl;
    cout << "GM = " << geometric_mean << endl;
    cout << "AM >= GM: " << (arithmetic_mean >= geometric_mean ? "成立" : "不成立") << endl;
    
    return arithmetic_mean >= geometric_mean;
}

// 验证等号成立条件
bool check_equality(double a, double b) {
    return abs(a - b) < 1e-9;
}

int main() {
    cout << "示例 1: a=4, b=9" << endl;
    verify_am_gm(4, 9);
    cout << "等号成立：" << check_equality(4, 9) << endl << endl;
    
    cout << "示例 2: a=4, b=4" << endl;
    verify_am_gm(4, 4);
    cout << "等号成立：" << check_equality(4, 4) << endl;
    
    return 0;
}
```

### 最优化应用

```cpp
// 问题：周长固定，求矩形最大面积
// 周长 P = 2(a + b)，面积 S = a × b
// 由 AM-GM：a + b ≥ 2√(ab)
// 所以 ab ≤ ((a+b)/2)²，当 a = b 时取等号

double max_area_given_perimeter(double P) {
    // 正方形时面积最大
    double side = P / 4;
    return side * side;
}

// 问题：和固定，求乘积最大值
// a + b = S（定值），求 ab 的最大值
// 由 AM-GM：ab ≤ (S/2)²

double max_product_given_sum(double S) {
    return (S / 2) * (S / 2);
}

int main() {
    cout << "周长 20 的矩形最大面积：" << max_area_given_perimeter(20) << endl;
    // 输出：25（边长为 5 的正方形）
    
    cout << "和为 10 的两数最大乘积：" << max_product_given_sum(10) << endl;
    // 输出：25（5×5）
    
    return 0;
}
```

### 不等式在算法中的应用

```cpp
// 三角不等式：|a + b| ≤ |a| + |b|
// 应用：最短路径、距离估计

double triangle_inequality(double a, double b) {
    return abs(a + b) <= abs(a) + abs(b);
}

// 排序不等式：顺序和 ≥ 乱序和 ≥ 逆序和
// 应用：贪心算法证明

bool rearrangement_inequality(const vector<int>& a, const vector<int>& b) {
    int n = a.size();
    
    // 顺序和
    int sorted_sum = 0;
    for (int i = 0; i < n; i++) {
        sorted_sum += a[i] * b[i];
    }
    
    // 逆序和
    int reverse_sum = 0;
    for (int i = 0; i < n; i++) {
        reverse_sum += a[i] * b[n - 1 - i];
    }
    
    cout << "顺序和：" << sorted_sum << endl;
    cout << "逆序和：" << reverse_sum << endl;
    cout << "顺序和 >= 逆序和：" << (sorted_sum >= reverse_sum ? "成立" : "不成立") << endl;
    
    return sorted_sum >= reverse_sum;
}
```

---

## 🏆 信竞应用

### 1. 贪心算法的正确性证明

```cpp
// 活动选择问题：选择最多的互不冲突的活动
// 贪心策略：按结束时间排序，每次选最早结束的

struct Activity {
    int start, finish;
};

bool compare_activities(const Activity& a, const Activity& b) {
    return a.finish < b.finish;
}

int max_activities(vector<Activity>& activities) {
    sort(activities.begin(), activities.end(), compare_activities);
    
    int count = 1;
    int last_finish = activities[0].finish;
    
    for (int i = 1; i < activities.size(); i++) {
        if (activities[i].start >= last_finish) {
            count++;
            last_finish = activities[i].finish;
        }
    }
    
    return count;
}

// 证明：贪心解 ≥ 最优解（通过不等式放缩）
```

### 2. 复杂度分析中的不等式

```
常用放缩：
- log(n!) = O(n log n)
- Σ(1/i) = O(log n) (i=1 to n)
- Σi = n(n+1)/2 = O(n²)
- Σi² = n(n+1)(2n+1)/6 = O(n³)
```

### 3. 二分答案的单调性证明

```cpp
// 证明 check(mid) 具有单调性
// 如果 mid 满足条件，则所有 > mid 的值都满足
// 如果 mid 不满足，则所有 < mid 的值都不满足

bool monotonicity_proof(int mid) {
    // 需要证明：check(mid) => check(mid + 1)
    // 或：!check(mid) => !check(mid - 1)
    return true;
}
```

---

## 🔗 相关题目

> ⚠️ 以下题目为经典题型，具体题号请验证后使用

| 类型 | 题目名称 | 来源 | 难度 | 知识点 |
|------|---------|------|------|--------|
| 数学题 | 不等式性质 | 课本习题 | ⭐ | 基本性质 |
| 数学题 | AM-GM 应用 | 课本习题 | ⭐⭐⭐ | 最值问题 |
| 编程题 | 贪心算法 | 洛谷 | ⭐⭐⭐ | 不等式证明 |
| 编程题 | 二分答案 | AtCoder | ⭐⭐⭐ | 单调性 |
| 编程题 | 最优化问题 | Codeforces | ⭐⭐⭐⭐ | AM-GM |

---

## 📚 拓展阅读

### 进阶知识（选学）

1. **琴生不等式**
   - 凸函数的性质
   - 推广了 AM-GM

2. **赫尔德不等式**
   - 柯西不等式的推广
   - 泛函分析基础

3. **闵可夫斯基不等式**
   - 三角不等式的推广
   - 度量空间基础

### 参考资料

- 《高中数学必修五》- 人教 A 版 - 第 3 章 不等式
- 《算法竞赛入门经典》- 刘汝佳 - 第 8 章 高效算法
- [OI Wiki - 贪心](https://oi-wiki.org/basic/greedy/)

---

## 🔜 下一篇

[练习] 不等式性质与基本不等式

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: [练习] 对数运算与对数函数  
**下一篇**: [练习] 不等式性质与基本不等式
