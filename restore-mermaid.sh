#!/bin/bash

# 恢复 mermaid 图表脚本

POST_DIR="source/_posts/series/01-LS1-基础代数"

echo "开始恢复 mermaid 图表..."

for file in "$POST_DIR"/*.md; do
    if [ -f "$file" ]; then
        # 替换 mermaid 注释为 mermaid 标签
        sed -i 's/<!-- mermaid 图表已移除，见下方描述 -->/{% mermaid %}/g' "$file"
        
        # 在 mermaid 代码块末尾添加结束标签
        # 查找 graph 开头的行，在下一个空行或新段落前添加 {% endmermaid %}
        awk '
        /{% mermaid %}/ {
            print
            in_mermaid = 1
            next
        }
        in_mermaid && /^$/ {
            print "{% endmermaid %}"
            print
            in_mermaid = 0
            next
        }
        in_mermaid && /^---$/ {
            print "{% endmermaid %}"
            print
            in_mermaid = 0
            next
        }
        { print }
        END {
            if (in_mermaid) print "{% endmermaid %}"
        }
        ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
        
        echo "已处理：$file"
    fi
done

echo "mermaid 图表恢复完成！"
