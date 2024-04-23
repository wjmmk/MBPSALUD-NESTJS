import { Test, TestingModule } from '@nestjs/testing';
import { ClinicalHistoriesService } from './clinical-histories.service';

describe('ClinicalHistoriesService', () => {
  let service: ClinicalHistoriesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ClinicalHistoriesService],
    }).compile();

    service = module.get<ClinicalHistoriesService>(ClinicalHistoriesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
