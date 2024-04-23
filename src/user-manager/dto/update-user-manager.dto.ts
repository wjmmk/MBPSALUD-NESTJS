import { PartialType } from '@nestjs/mapped-types';
import { CreateUserManagerDto } from './create-user-manager.dto';

export class UpdateUserManagerDto extends PartialType(CreateUserManagerDto) {}
