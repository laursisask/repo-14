module.exports = {
  extends: '@exodus/eslint-config/javascript',
  overrides: [
    {
      extends: '@exodus/eslint-config/typescript',
      files: ['*.{ts,tsx}'],
      parserOptions: {
        project: ['./tsconfig.test.json'],
      },
      rules: {
        'unicorn/prefer-top-level-await': 'off',
      },
    },
  ],
}
