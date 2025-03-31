import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterservice'
})
export class FilterservicePipe implements PipeTransform {
  transform(providerList: any[], serviceType: string): any[] {
    if (serviceType === 'All') return providerList;
    return providerList.filter(provider => provider.service === serviceType);
  }
}
