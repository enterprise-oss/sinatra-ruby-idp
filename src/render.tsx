import { render } from 'react-dom'
import Application from './Application'

interface ReactComponentMap {
  [key: string]: React.FunctionComponent<unknown>
}
const ComponentMap: ReactComponentMap = {
  Application: Application,
}

export const renderReactComponents = () => {
  for (const node of document.querySelectorAll<HTMLElement>(
    '[data-react-class]'
  )) {
    if (node.dataset.reactClass == undefined) {
      continue
    }

    const Component = ComponentMap[node.dataset.reactClass]
    if (Component !== undefined) {
      const props =
        node.dataset.props !== undefined ? JSON.parse(node.dataset.props) : {}

      render(<Component {...props} />, node)
    } else {
      console.warn(`No component for ${node.dataset.reactClass}`)
    }
  }
}
