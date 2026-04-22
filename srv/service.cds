using { bs as my } from '../db/schema.cds';
using { northwind as external } from './external/northwind';

@path : '/service/bsService'
service bsService
{
    @restrict : [
        { grant: 'READ', to: ['Manager_Role', 'Employee_Role'] },
        { grant: 'WRITE', to: 'Manager_Role' },
        { grant: 'addStock', to: 'Manager_Role' },
        { grant: 'getStock', to: ['Manager_Role', 'Employee_Role'] }
    ]
    entity Book as projection on my.book;
    @requires :[ 'Manager_Role' ]
    entity Author as projection on my.author;
    
    entity Products as projection on external.Products;
    entity Employees as projection on external.Employees;

}

annotate bsService.Book with @(
    odata.draft.enabled: true,
    fiori.draft.enabled: true,
    odata.draft.bypass: true,

    UI.LineItem: [
        {
            $type : UI.DataField,
            Label: 'Title',
            Value: title
        },
    
        {
            $type : UI.DataField,
            Label: 'Description',
            Value: description
        }
    ]
);

annotate bsService with @requires :
[
    'authenticated-user'
];
