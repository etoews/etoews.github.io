---
layout: default
---

<ul>
{% for category in site.categories %}
  <li>{{ category[0] }}</li>
    <ul>
    {% for post in category[1] %}
      <li>{{ post.title }}</li>
    {% endfor %}
    </ul>
{% endfor %}
</ul>
