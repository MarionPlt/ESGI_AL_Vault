import { NgModule } from '@angular/core';

import { MatButtonModule } from '@angular/material/button';
import { MatTableModule } from '@angular/material/table';

const declarations = [
  MatButtonModule,
  MatTableModule
];

@NgModule({
  declarations: [],
  imports: declarations,
  exports: declarations
})
export class MaterialModule { }
