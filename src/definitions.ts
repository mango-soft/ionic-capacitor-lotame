import type { IGenericResponse } from './generic.interface';

export interface MangoSoftLotamePlugin {
  // echo(options: { value: string }): Promise<{ value: string }>;
  initialize(options: { clientId: string }): Promise<IGenericResponse>;
  addBehavior(options: { data: any }): Promise<IGenericResponse>;
}
