import { Injectable } from '@nestjs/common';

@Injectable()
export class AppRepository {
  getValuesToLog(): Array<string> {
    return ['Hey, Nestjs standalone!', `Now: ${new Date().toISOString()}`];
  }
}
