import { WebPlugin } from '@capacitor/core';

import type { MangoLotamePlugin } from './definitions';
import type { IGenericResult } from './generic.interface';

export class MangoLotameWeb extends WebPlugin implements MangoLotamePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async initialize(options: { clientId: string }): Promise<IGenericResult> {
    
    return {
      message: 'Lotame Working from Mango Plugin for Web: ' + options
    }
  }

  async getContacts(filter: string): Promise<{ results: any[] }> {
    console.log('filter: ', filter);
    return {
      results: [
        {
          firsName: 'Dummy',
          lastName: 'Entry',
          telephone: '123456',
        }
      ]
    }
  }
}
