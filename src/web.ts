import { WebPlugin } from '@capacitor/core';

import type { MangoLotamePlugin } from './definitions';

export class MangoLotameWeb extends WebPlugin implements MangoLotamePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
