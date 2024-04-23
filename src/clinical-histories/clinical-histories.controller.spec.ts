import { Test, TestingModule } from '@nestjs/testing';
import { ClinicalHistoriesController } from './clinical-histories.controller';
import { ClinicalHistoriesService } from './clinical-histories.service';

describe('ClinicalHistoriesController', () => {
  let controller: ClinicalHistoriesController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ClinicalHistoriesController],
      providers: [ClinicalHistoriesService],
    }).compile();

    controller = module.get<ClinicalHistoriesController>(ClinicalHistoriesController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
