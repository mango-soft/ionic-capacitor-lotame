import type { IGenericResult } from './generic.interface';

export interface MangoLotamePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  initialize(options: { clientId: string }): Promise<IGenericResult>;
  addBehavior(options: { data: any }): Promise<IGenericResult>;
}
