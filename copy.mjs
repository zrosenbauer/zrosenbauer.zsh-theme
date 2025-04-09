import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

try {
  const __filename = fileURLToPath(import.meta.url);
  const __dirname = path.dirname(__filename);

  const themeOutputPath  = path.join(process.env.HOME, '.oh-my-zsh/themes/zrosenbauer.zsh-theme');

  fs.copyFileSync(path.join(__dirname, 'zrosenbauer.zsh-theme'), themeOutputPath);

  console.log(`✅ Theme copied to ${themeOutputPath}, run \`omz reload\` to apply`);
} catch (error) {
  console.error(`❌ Error: ${error}`);
}