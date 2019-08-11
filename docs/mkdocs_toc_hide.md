# mkdocs hide toc(Table of Contetns) 컨텐츠 테이블 감추기

<https://github.com/squidfunk/mkdocs-material/issues/478>

## CSS

`material/assets/stylesheets/application.0284f74d.css`

60em 을 적당히 큰 수치(260em)로 변경해 표시되지 않도록 합니다.

```css
@media only screen and (min-width:60em){.md-content{margin-right:0}[dir=rtl]
```

```css
@media only screen and (min-width:260em){.md-content{margin-right:0}[dir=rtl]
```


## HTML

`material/partials/nav-item.html`

`toc_` 링크 부분을 처리되지 않도록 합니다.

```html
    {% if toc_ | first is defined %}
      <label class="md-nav__link md-nav__link--active" for="__toc">
        {{ nav_item.title }}
      </label>
    {% endif %}
```

```html
    {% if False and toc_ | first is defined %}
      <label class="md-nav__link md-nav__link--active" for="__toc">
        {{ nav_item.title }}
      </label>
    {% endif %}
```
