# Hygen Templates

Генераторы компонентов для архитектуры **Atomic Design** с использованием [Hygen](https://github.com/jondot/hygen/). Помогают быстро и единообразно создавать UI-компоненты.

## Использование в проекте

### 1. Подключите шаблоны как сабмодуль

Выполните в корне проекта:

```bash
git submodule add https://github.com/quantumVector/hygen-templates.git _templates
```

Папка _templates/ будет автоматически распознана Hygen как директория с шаблонами.

### 2. Установите Hygen в основном проекте

Установите Hygen глобально:

```bash
npm install -g hygen
```

Либо используйте через npx без глобальной установки:

```bash
npx hygen ...
```

## Структура генерации

Генераторы создают компоненты в формате:

```bash
src/shared/ui/<layer>/<component>/
├── index.tsx
└── styles.module.scss
```

Где `<layer>` — это один из уровней Atomic Design:

- atom
- molecule
- organism
- template

## Использование

Запуск генерации компонента:

```bash
hygen <layer> new <component>
```

Примеры:

```bash
hygen atom new button
hygen molecule new header
hygen organism new slider
hygen template new auth
```

### Пример результата

Команда:

```bash
hygen atom new button
```

Создаст:

```bash
src/shared/ui/atom/button/
├── index.tsx
└── styles.module.scss
```

## Интерактивный режим

Если в шаблоне есть файл `prompt.cjs`, при генерации можно использовать интерактивный запрос с вводом названия компонента:

```bash
hygen atom new
```

Hygen задаст вопрос, например:

```bash
✔ Введите название компонента: 
```

## Содержание папки _templates в проекте

Папка `_templates/` содержит шаблоны Hygen для генерации каждого уровня.

```bash
_templates/
├── atom/
│   └── new/
│       ├── index.ejs.t
│       ├── styles.ejs.t
│       └── prompt.cjs (необязательно)
...
```

## Как устроен шаблон (пример шаблона)

Шаблоны Hygen используют EJS-синтаксис для вставки переменных в файлы. Ниже — пример шаблона index.ejs.t, который создаёт компонент на React с подключёнными стилями:

```ejs
---
to: src/shared/ui/atom/<%= name %>/index.tsx
---
import styles from './styles.module.scss';

interface <%= h.changeCase.pascalCase(name) %>Props {
// add props here
}

export const <%= h.changeCase.pascalCase(name) %> = ({}: <%= h.changeCase.pascalCase(name) %>Props) => {
return <div className={styles.<%= h.changeCase.camelCase(name) %>}></div>;
};
```

## Обновление шаблонов в проекте

Если шаблоны изменились — в основном проекте нужно выполнить:

```bash
git submodule update --remote
```
