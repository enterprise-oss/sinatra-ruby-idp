import React from 'react'
import format from 'xml-formatter'
import { useFetch } from 'usehooks-ts'
import {
  Button,
  Group,
  LoadingOverlay,
  Modal,
  useMantineTheme,
} from '@mantine/core'
import { useClipboard } from '@mantine/hooks'

const url = `/decode-saml-request`

interface DecodedSamlRequest {
  decodedSamlRequest?: string
}

interface SamlRequestDebugProps {
  samlRequest: string
}

const SamlRequest: React.FunctionComponent<SamlRequestDebugProps> = ({
  samlRequest,
}) => {
  const clipboard = useClipboard({ timeout: 500 })

  const { data, error } = useFetch<DecodedSamlRequest>(`${url}`, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ SAMLRequest: samlRequest }),
  })

  if (error) return <p>Could not decode SAML request.</p>

  if (!data)
    return (
      <div style={{ width: 400, position: 'relative' }}>
        <LoadingOverlay visible={true} />
      </div>
    )

  return (
    <>
      <Group position='center'>
        <Button
          color={clipboard.copied ? 'teal' : 'blue'}
          onClick={() => clipboard.copy(data.decodedSamlRequest)}
        >
          Copy Request
        </Button>
      </Group>
      <code>
        <pre>
          {format(data.decodedSamlRequest ?? '', { collapseContent: false })}
        </pre>
      </code>
    </>
  )
}

interface SamlRequestDebugModalProps {
  samlRequest: string
  opened: boolean
  onClose: () => void
}

const SamlRequestDebugModal: React.FunctionComponent<
  SamlRequestDebugModalProps
> = ({ samlRequest, opened, onClose }) => {
  const theme = useMantineTheme()
  return (
    <>
      <Modal
        opened={opened}
        onClose={onClose}
        title='SAML Request'
        size='70%'
        transition='fade'
        transitionDuration={600}
        transitionTimingFunction='ease'
        overflow='inside'
        overlayColor={
          theme.colorScheme === 'dark'
            ? theme.colors.dark[9]
            : theme.colors.gray[2]
        }
        overlayOpacity={0.55}
        overlayBlur={3}
      >
        <SamlRequest samlRequest={samlRequest} />
      </Modal>
    </>
  )
}

export default SamlRequestDebugModal
