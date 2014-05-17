---
layout: default
---

<ul>
{% for category in site.categories %}
  <li>{{ category[0] }}</li>
    <ul>
    {% for post in category[1] %}
      <li><a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
{% endfor %}
</ul>
