using { bs as my } from '../db/schema.cds';
using { northwind as external } from './external/northwind';

@path : '/service/bsService'
service bsService
{
    entity Book as projection on my.book;
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
