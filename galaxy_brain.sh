REPO_NAME="teste-galaxy-brain"
DISCUSSION_TITLE="Como fazer um loop infinito bonito em JavaScript?"
DISCUSSION_BODY="Tô tentando escrever um loop infinito com estilo. Alguma sugestão?"
ANSWER_BODY='while(true) console.log("bonito é ser infinito, não infinito ser bonito");'

echo "===> [Secundária] Criando repositório com Discussions habilitado..."
gh repo create $REPO_NAME --public --enable-discussions --confirm

cd $REPO_NAME

echo "===> [Secundária] Criando discussão..."
DISCUSSION_URL=$(gh api graphql -f query='mutation($repoId: ID!, $title: String!, $body: String!, $categoryId: ID!) {
  createDiscussion(input: {
    repositoryId: $repoId,
    title: $title,
    body: $body,
    categoryId: $categoryId
  }) {
    discussion {
      url
    }
  }
}' -F repoId=$(gh api repos/$(gh repo view --json nameWithOwner -q .nameWithOwner) | jq -r .id) \
   -F title="$DISCUSSION_TITLE" -F body="$DISCUSSION_BODY" \
   -F categoryId=$(gh api repos/$(gh repo view --json nameWithOwner -q .nameWithOwner)/discussions/categories | jq -r '.[0].id') \
   | jq -r '.data.createDiscussion.discussion.url')

echo "===> Acesse com a conta principal e responda aqui:"
echo "$DISCUSSION_URL"
echo "===> Após responder, com a conta secundária, marque a resposta como 'melhor resposta'."
