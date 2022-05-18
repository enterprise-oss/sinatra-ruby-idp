import { useReducer } from "react";
import {
  Blockquote,
  Button,
  Center,
  Container,
  Paper,
  Space,
  Stack,
  TextInput,
  Title,
} from "@mantine/core";
import { getSamlRequest } from "../utils";
import { Ce, UserCircle } from "tabler-icons-react";
interface LoginFormProps {
  username?: string;
}

const LoginForm: React.FunctionComponent<LoginFormProps> = ({ username }) => {
  const [isSubmitting, submitting] = useReducer(() => true, false);

  return (
    <Container>
      <form
        className="bc-form bc-login"
        id="new_user"
        autoComplete="off"
        action="/saml-login"
        acceptCharset="UTF-8"
        method="post"
        onSubmit={() => submitting()}
      >
        <input type="hidden" name="SAMLRequest" value={getSamlRequest()} />
        <Center>
          <Title order={1}>SAML Mock Identity Provider</Title>
        </Center>
        <Center>
          <Blockquote
            cite="Use this application as mock SAML identity provider."
            icon={<UserCircle size={24} />}
          >
            An easy way to test your SAML
          </Blockquote>
        </Center>
        <Paper shadow="md" p="lg">
          <Stack spacing="md">
            <TextInput
              label="Username"
              size="lg"
              placeholder="somebody@example.com"
              name="username"
              id="username"
              value={username}
            />
            <TextInput
              label="Password"
              size="lg"
              autoComplete="current-password"
              name="password"
              id="password"
              type="password"
            />
            <Space h="lg" />
            <Button
              type="submit"
              size="lg"
              name="commit"
              value="login"
              disabled={isSubmitting}
            >
              {isSubmitting ? "Logging in…" : "Log in"}
            </Button>
          </Stack>
        </Paper>
      </form>
    </Container>
  );
};

export default LoginForm;
