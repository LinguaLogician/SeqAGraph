import os
import pandas as pd
from tqdm import tqdm

from .dataset_base import DataLoad
from .data_utils import canonicalize_smiles, smi2token, download

URL = 'https://www.dropbox.com/scl/fo/tljb4n130cj2e3hq9wjqz/h?dl=0&rlkey=vwtmxeum4989017rn86eqiq07'

class usptofull(DataLoad):
    def __init__(self):
        super(usptofull, self).__init__(
            dataset_name='uspto_full',
            preprocess_step='smi2token'
        )

    def process(self):
        train = {
            'reaction_type': [],
            'product_token': [],
            'reactant_token': []
        }
        eval = {
            'reaction_type': [],
            'product_token': [],
            'reactant_token': []
        }
        test = {
            'reaction_type': [],
            'product_token': [],
            'reactant_token': []
        }
        data_count = {'train': 0, 'eval': 0, 'test': 0}
        for mode, data in (('train', train), ('eval', eval), ('test', test)):
            data_path = os.path.join(self.raw_dir, f'{mode}.csv')
            if not os.path.exists(data_path):
                download(
                    url=URL,
                    save_dir=self.raw_dir,
                    file_name='data.zip'
                )
            self.load(mode=mode)
            raw_data = self.data[mode]
            for smi, type in tqdm(zip(raw_data['reactants>reagents>production'], raw_data['class']),
                desc=f'split {self.name}: {mode}.csv SMILES...', total=len(raw_data)):
                reac, prod = tuple(smi.split('>>'))
                data['reaction_type'].append(type)
                data['product_token'].append(prod)
                data['reactant_token'].append(reac)
                data_count[mode] += 1

            pd.DataFrame(data).to_csv(os.path.join(self.process_dir, f'token({mode}).csv'), index=False)
            self.logger.info('{preprocess_step}--> data size({mode}):{data_count}'.format(
                preprocess_step=self.preprocess_step, mode=mode, data_count=data_count[mode]
            ))
        self.logger.info(f'{self.preprocess_step}--> finish.')
        self.logger.info('\n')

if __name__ == '__main__':
    dataset = usptofull()
    dataset.process()