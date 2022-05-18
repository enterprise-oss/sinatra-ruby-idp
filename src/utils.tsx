/**
 * Get public url of the app
 * @returns
 */
export const getPublicUrl = (): string | null => {
  const publicUrl = document.head.querySelector<HTMLMetaElement>(
    '[name="public-url"]'
  )

  return publicUrl ? publicUrl.content : 'http://127.0.0.1:9292'
}

/**
 * Get SAML request from the page
 *
 * @returns
 */
export const getSamlRequest = (): string => {
  const queryString = window.location.search
  const urlParams = new URLSearchParams(queryString)

  return urlParams.get('SAMLRequest') ?? ''
}
