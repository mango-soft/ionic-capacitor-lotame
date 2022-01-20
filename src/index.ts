import { registerPlugin } from '@capacitor/core';

import type { MangoSoftLotamePlugin } from './definitions';

const MangoSoftLotame = registerPlugin<MangoSoftLotamePlugin>('MangoSoftLotame', {
  web: () => import('./web').then(m => new m.MangoSoftLotameWeb()),
});

export * from './definitions';
export { MangoSoftLotame };
