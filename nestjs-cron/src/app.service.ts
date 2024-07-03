import { Injectable } from '@nestjs/common';
import { AppRepository } from './app.repository';

@Injectable()
export class AppService {
  constructor(private readonly appRepository: AppRepository) {}

  logMessages(): void {
    const messages = this.appRepository.getValuesToLog();
    for (const message of messages) {
      console.log(message);
    }
  }
}
