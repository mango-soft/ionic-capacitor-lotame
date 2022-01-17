import { WebPlugin } from '@capacitor/core';

import type { MangoLotamePlugin } from './definitions';
import type { IGenericResult } from './generic.interface';

export class MangoLotameWeb extends WebPlugin implements MangoLotamePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  /**
   * Initialize Lotame.
   * 
   * @param options 
   * @returns 
   */
  async initialize(options: { clientId: string }): Promise<IGenericResult> {
    
    return {
      message: 'Lotame Working from Mango Plugin for Web: ' + options
    }
  }

  async addBehavior(options: { data: any }): Promise<IGenericResult> {
    
    return {
      message: 'Lotame behavior added for Web',
      data: options.data
    }
  }
}
