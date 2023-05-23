import { Bind, Controller, Get, Param } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Bind(Param())
  getHello(name?: string): string {
    return this.appService.getHello(name);
  }
}
