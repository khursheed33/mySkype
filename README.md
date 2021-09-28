

name: Generate README every 1 hour

on:
  schedule:
    - cron: "0 * * * *"
  workflow_dispatch:

jobs:
  stuff:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Let the magic happen
        uses: actions/setup-node@v1
        with:
          node-version: 14.6.0

      - run: yarn

      - run: node .
        env:
          SPOTIFY_CLIENT_ID: ${{ secrets.SPOTIFY_CLIENT_ID }}
          SPOTIFY_CLIENT_SECRET: ${{ secrets.SPOTIFY_CLIENT_SECRET }}
          SPOTIFY_REFRESH_TOKEN: ${{ secrets.SPOTIFY_REFRESH_TOKEN }}

      - name: Add to git repo
        run: |
          git add .
          git config --global user.name "Your Name"
          git config --global user.email "Your E-Mail"
          git commit -m "[Magic] Automated README update"
      - name: Push
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
