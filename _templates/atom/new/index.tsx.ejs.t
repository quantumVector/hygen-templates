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
