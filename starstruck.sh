echo "===> Dando stars em 16 repositórios top..."

REPOS=(
"vercel/next.js"
"facebook/react"
"vuejs/vue"
"microsoft/vscode"
"nodejs/node"
"expressjs/express"
"nestjs/nest"
"axios/axios"
"twbs/bootstrap"
"tailwindlabs/tailwindcss"
"storybookjs/storybook"
"lodash/lodash"
"moment/moment"
"pmndrs/react-three-fiber"
"mui/material-ui"
"react-hook-form/react-hook-form"
)

for repo in "${REPOS[@]}"; do
  echo "🌟 Star: $repo"
  gh repo star $repo || echo "Erro ao dar star em $repo"
done

echo "===> 16 estrelas dadas. A badge 'Starstruck' deve aparecer logo!"
