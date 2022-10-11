import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Item } from 'src/app/shared/models/items/Item';
import { ItemService } from 'src/app/shared/services/item-service/item.service';

@Component({
  selector: 'app-item-list',
  templateUrl: './item-list.component.html',
  styleUrls: ['./item-list.component.css']
})
export class ItemListComponent implements OnInit {
  items: Item[] = [];
  itemsDataSource!: MatTableDataSource<Item>;
  columns = ['label', 'type', 'releaseDate', 'support'];

  constructor(private itemService: ItemService) { 
    this.itemService.getAllItems().subscribe((result) => {
      this.items = result;
      this.itemsDataSource = new MatTableDataSource(this.items);
    });
  }

  ngOnInit(): void {
  }

}
