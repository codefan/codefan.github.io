---
title: "[教程] 01-集合、命题与逻辑用语"
date: 2026-03-23 10:00:00
updated: 2026-03-23 10:30:00
tags: [LS-1, 教程，代数，集合，逻辑]
categories: [代数]
series: "信息竞赛数学教程"
series_order: 1
---

## 🎮 情景引入

> 想象你在玩一个 RPG 游戏，你的背包里有这些装备：
> 
> - 武器：剑、弓、法杖
> - 防具：盔甲、盾牌
> - 药水：生命药水、魔法药水
> 
> 你的好友也有一个背包。现在系统要判断：
> - 你们**共有**的装备有哪些？→ **交集**
> - 你们**所有**的装备合起来有哪些？→ **并集**
> - 你没有但好友有的装备？→ **补集**
> 
> 这就是集合运算！在信竞中，集合思想无处不在——从状态压缩到位运算，从容斥原理到图论算法。

---

## 📖 直观理解

### 1. 什么是集合？

**集合**就是把一些东西放在一起，形成一个整体。

```
集合 A = {剑，弓，法杖}
集合 B = {盔甲，盾牌，剑}
```

**关键特性**：
- ✅ **确定性**：一个东西要么在集合里，要么不在（没有"可能在"）
- ✅ **互异性**：集合里的东西不能重复（{剑，剑，弓} = {剑，弓}）
- ✅ **无序性**：{剑，弓} 和 {弓，剑} 是同一个集合

### 2. 集合的表示方法

**列举法**：直接列出所有元素
```
A = {1, 2, 3, 4, 5}
B = {红，黄，蓝}
```

**描述法**：用条件描述
```
A = {x | x 是正整数，且 x < 6}
B = {x | x 是三原色之一}
```

**信竞中的集合**：
```cpp
// C++ 中的集合
set<int> A = {1, 2, 3, 4, 5};
set<char> B = {'R', 'G', 'B'};

// 或者用位运算表示集合（状态压缩）
int mask = 0b11111;  // 表示集合 {0,1,2,3,4}
```

### 3. 集合的关系

<!-- mermaid 图表已移除，见下方描述 -->
graph TD
    subgraph 集合关系
        A[子集 A⊆B] --> B1[A 的所有元素都在 B 中]
        C[真子集 A⊂B] --> C1[A 是 B 的子集，但 A≠B]
        D[相等 A=B] --> D1[A 和 B 有完全相同的元素]
    end


**示例**：
```
A = {1, 2, 3}
B = {1, 2, 3, 4, 5}
C = {1, 2, 3}

则：A⊆B (A 是 B 的子集)
    A⊂B (A 是 B 的真子集)
    A=C (A 和 C 相等)
```

### 4. 韦恩图（Venn Diagram）

韦恩图是表示集合关系的直观工具：

```
        ┌─────────────┐
        │      A      │
        │   ┌─────┐   │
        │   │ A∩B │   │
        │   └─────┘   │
        │      B      │
        └─────────────┘
```

**常见韦恩图**：

<!-- mermaid 图表已移除，见下方描述 -->
graph TD
    subgraph 韦恩图示例
        U1[全集 U] --> A1[A∩B 交集]
        U1 --> A2[A∪B 并集]
        U1 --> A3[A-B 差集]
        U1 --> A4[∁ᵤA 补集]
    end


---

## 📐 数学定义

### 集合的基本运算

**1. 交集 (Intersection)**：两个集合**共有**的元素

$$
A \cap B = \{x \mid x \in A \text{ 且 } x \in B\}
$$

**示例**：
```
A = {1, 2, 3, 4}
B = {3, 4, 5, 6}
A ∩ B = {3, 4}
```

**2. 并集 (Union)**：两个集合**所有**的元素（去重）

$$
A \cup B = \{x \mid x \in A \text{ 或 } x \in B\}
$$

**示例**：
```
A = {1, 2, 3}
B = {3, 4, 5}
A ∪ B = {1, 2, 3, 4, 5}
```

**3. 补集 (Complement)**：在全集中**不属于**某集合的元素

$$
\complement_U A = \{x \mid x \in U \text{ 且 } x \notin A\}
$$

**示例**：
```
全集 U = {1, 2, 3, 4, 5}
A = {1, 2, 3}
∁ᵤA = {4, 5}
```

**4. 差集 (Difference)**：属于 A 但不属于 B 的元素

$$
A - B = \{x \mid x \in A \text{ 且 } x \notin B\}
$$

**示例**：
```
A = {1, 2, 3, 4}
B = {3, 4, 5}
A - B = {1, 2}
```

### 集合运算律

集合运算满足以下重要定律（证明用韦恩图或代数法）：

**1. 交换律**
$$
A \cap B = B \cap A \\
A \cup B = B \cup A
$$

**2. 结合律**
$$
(A \cap B) \cap C = A \cap (B \cap C) \\
(A \cup B) \cup C = A \cup (B \cup C)
$$

**3. 分配律**
$$
A \cap (B \cup C) = (A \cap B) \cup (A \cap C) \\
A \cup (B \cap C) = (A \cup B) \cap (A \cup C)
$$

**4. 德摩根定律（De Morgan's Laws）** ⭐重要

$$
\complement_U(A \cup B) = \complement_U A \cap \complement_U B \\
\complement_U(A \cap B) = \complement_U A \cup \complement_U B
$$

**通俗理解**：
- "不 (A 或 B)" = "非 A 且 非 B"
- "不 (A 且 B)" = "非 A 或 非 B"

**编程中的应用**：
```cpp
// 德摩根定律在条件判断中的应用
if (!(a || b))  // 等价于
if (!a && !b)

if (!(a && b))  // 等价于
if (!a || !b)
```

### 集合的基数

**基数**：集合中元素的个数，记作 |A| 或 card(A)

**容斥原理**（两个集合）：
$$
|A \cup B| = |A| + |B| - |A \cap B|
$$

**容斥原理**（三个集合）：
$$
\begin{aligned}
|A \cup B \cup C| = &|A| + |B| + |C| \\
&- |A \cap B| - |A \cap C| - |B \cap C| \\
&+ |A \cap B \cap C|
\end{aligned}
$$

**示例**：
```
某班有 50 人，30 人会编程，25 人会数学，15 人两者都会。
问：至少会一项的有多少人？

|编程 ∪ 数学| = |编程| + |数学| - |编程 ∩ 数学|
             = 30 + 25 - 15 = 40 人
```

---

## 💻 代码实现

### C++ STL set 基本操作

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    // 创建集合
    set<int> A = {1, 2, 3, 4};
    set<int> B = {3, 4, 5, 6};
    
    // 1. 交集
    set<int> intersection;
    set_intersection(A.begin(), A.end(), 
                     B.begin(), B.end(),
                     inserter(intersection, intersection.begin()));
    // intersection = {3, 4}
    
    // 2. 并集
    set<int> union_set;
    set_union(A.begin(), A.end(),
              B.begin(), B.end(),
              inserter(union_set, union_set.begin()));
    // union_set = {1, 2, 3, 4, 5, 6}
    
    // 3. 差集 (A - B)
    set<int> difference;
    set_difference(A.begin(), A.end(),
                   B.begin(), B.end(),
                   inserter(difference, difference.begin()));
    // difference = {1, 2}
    
    // 4. 判断子集
    bool is_subset = includes(B.begin(), B.end(), 
                              A.begin(), A.end());
    // is_subset = false (A 不是 B 的子集)
    
    // 5. 集合的基数（元素个数）
    cout << "A 的大小：" << A.size() << endl;  // 4
    
    return 0;
}
```

### 位运算表示集合（状态压缩）

在信竞中，当集合元素是连续整数（如 0~n-1）时，常用**位运算**表示集合：

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    // 用二进制位表示集合
    // 第 i 位为 1 表示元素 i 在集合中
    int A = 0b01111;  // 集合 {0, 1, 2, 3}
    int B = 0b11000;  // 集合 {3, 4}
    
    // 1. 交集：按位与
    int intersection = A & B;  // 0b01000 = {3}
    
    // 2. 并集：按位或
    int union_set = A | B;     // 0b11111 = {0,1,2,3,4}
    
    // 3. 补集：按位取反（需要指定全集）
    int U = 0b11111;  // 全集 {0,1,2,3,4}
    int complement = (~A) & U;  // 0b10000 = {4}
    
    // 4. 差集：A & (~B)
    int difference = A & (~B);  // 0b00111 = {0,1,2}
    
    // 5. 判断元素是否在集合中
    bool has_2 = (A >> 2) & 1;  // true (第 2 位是 1)
    bool has_4 = (A >> 4) & 1;  // false (第 4 位是 0)
    
    // 6. 添加/删除元素
    A |= (1 << 4);   // 添加元素 4: A = {0,1,2,3,4}
    A &= ~(1 << 2);  // 删除元素 2: A = {0,1,3,4}
    
    // 7. 计算集合的基数（元素个数）
    int count = __builtin_popcount(A);  // GCC 内置函数，返回 1 的个数
    
    return 0;
}
```

**位运算常用技巧**：

| 操作 | 代码 | 说明 |
|------|------|------|
| 添加元素 i | `mask |= (1 << i)` | 第 i 位置 1 |
| 删除元素 i | `mask &= ~(1 << i)` | 第 i 位置 0 |
| 判断元素 i | `(mask >> i) & 1` | 检查第 i 位 |
| 切换元素 i | `mask ^= (1 << i)` | 第 i 位取反 |
| 最低位 1 | `mask & -mask` | lowbit 操作 |
| 删除最低位 1 | `mask &= mask - 1` | 常用于枚举子集 |

---

## 📝 命题与逻辑用语

### 什么是命题？

**命题**：可以判断真假的陈述句。

**示例**：
- ✅ "2 + 2 = 4"（真命题）
- ✅ "所有质数都是奇数"（假命题，2 是质数但不是奇数）
- ❌ "x > 3"（不是命题，x 未知）
- ❌ "你好吗？"（不是命题，是疑问句）
- ❌ "请关上门"（不是命题，是祈使句）

### 逻辑联结词

| 联结词 | 符号 | 含义 | 示例 |
|--------|------|------|------|
| 且 (AND) | ∧ 或 && | 两个都真才真 | p∧q |
| 或 (OR) | ∨ 或 \|\| | 一个真就真 | p∨q |
| 非 (NOT) | ¬ 或 ! | 取反 | ¬p |
| 蕴含 (IMPLIES) | → | 若 p 则 q | p→q |
| 等价 (IFF) | ↔ | p 当且仅当 q | p↔q |

**真值表**：

| p | q | p∧q | p∨q | ¬p | p→q | p↔q |
|---|---|-----|-----|----|-----|-----|
| T | T | T | T | F | T | T |
| T | F | F | T | F | F | F |
| F | T | F | T | T | T | F |
| F | F | F | F | T | T | T |

**重要说明**：
- **蕴含 p→q**：只有"前真后假"时为假，其余情况都为真
  - "如果太阳从西边出来，那么 1+1=3"——这是真命题！（因为前提为假）
- **等价 p↔q**：p 和 q 同真同假时为真

### 量词

**全称量词**（∀）："对所有..."、"任意一个..."

$$
\forall x \in \mathbb{R}, x^2 \geq 0
$$

读作："对所有实数 x，x 的平方大于等于 0"

**存在量词**（∃）："存在..."、"至少有一个..."

$$
\exists x \in \mathbb{R}, x^2 = 4
$$

读作："存在实数 x，使得 x 的平方等于 4"（x=2 或 x=-2）

**唯一存在量词**（∃!）："存在唯一的..."

$$
\exists! x \in \mathbb{R}, x^2 = 0
$$

读作："存在唯一的实数 x，使得 x 的平方等于 0"（x=0）

**量词的否定**：
- ¬(∀x, P(x)) ⇔ ∃x, ¬P(x)
- ¬(∃x, P(x)) ⇔ ∀x, ¬P(x)
- ¬(∃!x, P(x)) ⇔ (∀x, ¬P(x)) ∨ (∃x∃y, x≠y ∧ P(x) ∧ P(y))

**示例**：
- "所有人都会飞"的否定是"存在一个人不会飞"
- "存在一个人数学考满分"的否定是"所有人都没考满分"
- "存在唯一的解"的否定是"无解或有多解"

**嵌套量词**：
```
∀x ∃y, x + y = 0  // 对任意 x，存在 y 使得 x+y=0（真，y=-x）
∃y ∀x, x + y = 0  // 存在 y 使得对任意 x 都有 x+y=0（假）
```
**注意**：量词顺序不能随意交换！

---

## 🏆 信竞应用

### 1. 状态压缩 DP

用二进制位表示集合，解决"选与不选"的问题：

```cpp
// 经典问题：旅行商问题 (TSP) 的状态压缩
// dp[mask][i] 表示访问过 mask 表示的城市集合，当前在城市 i 的最短路径
int dp[1 << 20][20];
int dist[20][20];
int n;

int solve() {
    memset(dp, 0x3f, sizeof(dp));
    dp[1][0] = 0;  // 从城市 0 出发
    
    for (int mask = 1; mask < (1 << n); mask++) {
        for (int i = 0; i < n; i++) {
            if ((mask >> i) & 1) {  // 如果城市 i 在集合中
                for (int j = 0; j < n; j++) {
                    if (!((mask >> j) & 1)) {  // 城市 j 不在集合中
                        int new_mask = mask | (1 << j);
                        dp[new_mask][j] = min(dp[new_mask][j], 
                                              dp[mask][i] + dist[i][j]);
                    }
                }
            }
        }
    }
    
    return dp[(1 << n) - 1][0];  // 回到起点
}
```

**复杂度分析**：
- 状态数：O(2^n × n)
- 转移：O(n)
- 总复杂度：O(2^n × n²)
- 适用范围：n ≤ 20

### 2. 容斥原理

计算多个集合的并集大小：

$$
|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |A \cap C| - |B \cap C| + |A \cap B \cap C|
$$

**一般形式**（n 个集合）：
$$
\left|\bigcup_{i=1}^n A_i\right| = \sum_{S \subseteq \{1,\dots,n\}, S \neq \emptyset} (-1)^{|S|-1} \left|\bigcap_{i \in S} A_i\right|
$$

**应用示例**：求 1~100 中能被 2 或 3 或 5 整除的数的个数

```cpp
int count(int n, int x) {
    return n / x;  // 1~n 中能被 x 整除的数的个数
}

int solve() {
    int n = 100;
    // 容斥原理
    int ans = count(n, 2) + count(n, 3) + count(n, 5)
            - count(n, 6) - count(n, 10) - count(n, 15)
            + count(n, 30);
    return ans;  // 74
}
```

**位运算实现容斥原理**（枚举子集）：

```cpp
// 枚举集合 S 的所有非空子集
void enumerate_subsets(int S) {
    for (int subset = S; subset > 0; subset = (subset - 1) & S) {
        // subset 是 S 的一个子集
        // 处理 subset...
    }
}
```

### 3. 集合判重

```cpp
// 用 set 自动去重
set<string> visited;
visited.insert("state1");
visited.insert("state2");
visited.insert("state1");  // 重复，不会插入

cout << visited.size();  // 输出 2

// 检查元素是否存在
if (visited.count("state1")) {
    cout << "已访问过";
}
```

### 4. 德摩根定律优化条件判断

```cpp
// 原条件：不是 (a 或 b 或 c)
if (!(a || b || c)) {
    // ...
}

// 等价于：非 a 且 非 b 且 非 c
if (!a && !b && !c) {
    // ...
}

// 在搜索剪枝中的应用
// 原条件：如果 (不满足条件 1 或 不满足条件 2)，剪枝
if (!check1(x) || !check2(x)) return;

// 等价于：如果 不满足 (条件 1 且 条件 2)，剪枝
if (!(check1(x) && check2(x))) return;
```

---

## 🔗 相关题目

> ⚠️ 以下题目为经典题型，具体题号请验证后使用

| 类型 | 题目名称 | 来源 | 难度 | 知识点 |
|------|---------|------|------|--------|
| 数学题 | 集合的基本运算 | 课本习题 | ⭐ | 交集、并集 |
| 数学题 | 容斥原理应用 | 奥数题 | ⭐⭐⭐ | 计数问题 |
| 编程题 | 集合操作 | 洛谷 | ⭐⭐ | STL set |
| 编程题 | 状态压缩入门 | AtCoder ABC | ⭐⭐⭐ | 位运算 |
| 编程题 | 容斥原理 | Codeforces | ⭐⭐⭐⭐ | 计数 + 数论 |
| 编程题 | 集合与位运算 | 洛谷 | ⭐⭐⭐⭐ | 状态压缩 |

---

## 📚 拓展阅读

### 进阶知识（选学）

1. **幂集**：集合 A 的所有子集构成的集合，记作 P(A) 或 2^A
   - 若 |A| = n，则 |P(A)| = 2^n
   
2. **笛卡尔积**：A × B = {(a,b) | a∈A, b∈B}
   - 若 |A|=m, |B|=n，则 |A×B| = m×n

3. **集合的划分**：将集合分成若干不相交的子集，且并集为原集合

4. **等价关系与等价类**：自反、对称、传递的关系

### 参考资料

- 《算法竞赛入门经典》- 刘汝佳 - 第 11 章 集合
- 《具体数学》- 第 1 章 递归问题
- 《离散数学及其应用》- 集合论部分
- [OI Wiki - 集合](https://oi-wiki.org/math/set/)
- [C++ STL set 文档](https://en.cppreference.com/w/cpp/container/set)

---

## 🔜 下一篇

[练习] 集合运算与逻辑推理

---

**本系列**: [信息竞赛数学教程](/series/math-tutorial/)  
**上一篇**: 无（系列第 1 篇）  
**下一篇**: [练习] 集合运算与逻辑推理
