export interface MangoLotamePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
