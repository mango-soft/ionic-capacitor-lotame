import { WebPlugin } from '@capacitor/core';

import type { MangoLotamePlugin } from './definitions';
import type { IGenericResponse } from './generic.interface';

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
  async initialize(options: { clientId: string }): Promise<IGenericResponse> {
    
    return {
      message: 'Lotame Working from Mango Plugin for Web: ' + options
    }
  }

  async addBehavior(options: { data: any }): Promise<IGenericResponse> {
    
    return {
      message: 'Lotame behavior added for Web',
      data: options.data
    }
  }
}
