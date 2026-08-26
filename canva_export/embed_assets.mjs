import { readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';

const root = resolve('F:/Github/Do_An_Ung_Dung_2/canva_export');
let html = await readFile(resolve(root, 'index.html'), 'utf8');

for (const name of ['image1.png', 'image3.png', 'image4.png']) {
  const bytes = await readFile(resolve(root, 'assets', name));
  const dataUri = `data:image/png;base64,${bytes.toString('base64')}`;
  html = html.replaceAll(`assets/${name}`, dataUri);
}

await writeFile(
  'F:/Github/Do_An_Ung_Dung_2/ScoreSense_Canva_Light_OpenSans.html',
  html,
  'utf8',
);
