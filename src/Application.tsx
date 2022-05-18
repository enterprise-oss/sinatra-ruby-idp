import {
  ActionIcon,
  Button,
  ColorScheme,
  ColorSchemeProvider,
  Group,
  MantineProvider,
  Space,
  useMantineColorScheme,
} from '@mantine/core'
import { TypographyStylesProvider } from '@mantine/core'
import { useState } from 'react'
import { MoonStars, Sun } from 'tabler-icons-react'
import LoginForm from './components/LoginForm'
import SamlConfigurationModal from './components/SamlConfigurationModal'
import SamlRequestDebugModal from './components/SamlRequestDebug'
import { getSamlRequest } from './utils'

const ThemeToggle = () => {
  const { colorScheme, toggleColorScheme } = useMantineColorScheme()
  const dark = colorScheme === 'dark'

  return (
    <ActionIcon
      variant='outline'
      color={dark ? 'yellow' : 'blue'}
      onClick={() => toggleColorScheme()}
      title='Toggle color scheme'
    >
      {dark ? <Sun size={18} /> : <MoonStars size={18} />}
    </ActionIcon>
  )
}
function App() {
  const [debugModalOpen, setDebugModalOpen] = useState(false)
  const [configurationModalOpen, setConfigurationModalOpen] = useState(false)
  const samlRequest = getSamlRequest() != ''
  const [colorScheme, setColorScheme] = useState<ColorScheme>('light')
  const toggleColorScheme = (value?: ColorScheme) =>
    setColorScheme(value ?? (colorScheme === 'dark' ? 'light' : 'dark'))

  return (
    <ColorSchemeProvider
      colorScheme={colorScheme}
      toggleColorScheme={toggleColorScheme}
    >
      <MantineProvider
        theme={{ colorScheme }}
        withGlobalStyles
        withNormalizeCSS
      >
        <TypographyStylesProvider>
          <Space h='sm' />
          <Group position='center'>
            <ThemeToggle />
            {samlRequest && (
              <Button onClick={() => setDebugModalOpen(true)}>
                View SAML request
              </Button>
            )}
            <Button onClick={() => setConfigurationModalOpen(true)}>
              View SAML configuration
            </Button>
          </Group>
          <Space h='md' />
          <LoginForm />

          {samlRequest && (
            <SamlRequestDebugModal
              samlRequest={getSamlRequest()}
              opened={debugModalOpen}
              onClose={() => setDebugModalOpen(false)}
            />
          )}

          <SamlConfigurationModal
            opened={configurationModalOpen}
            onClose={() => setConfigurationModalOpen(false)}
          />
        </TypographyStylesProvider>
      </MantineProvider>
    </ColorSchemeProvider>
  )
}

export default App
