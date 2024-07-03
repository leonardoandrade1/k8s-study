import { Module } from '@nestjs/common';
import { AppService } from './app.service';
import { AppRepository } from './app.repository';

@Module({
  imports: [],
  providers: [AppService, AppRepository],
})
export class AppModule {}
