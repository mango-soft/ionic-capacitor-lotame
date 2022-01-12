import { registerPlugin } from '@capacitor/core';

import type { MangoLotamePlugin } from './definitions';

const MangoLotame = registerPlugin<MangoLotamePlugin>('MangoLotame', {
  web: () => import('./web').then(m => new m.MangoLotameWeb()),
});

export * from './definitions';
export { MangoLotame };
