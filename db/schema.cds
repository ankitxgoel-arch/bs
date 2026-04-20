namespace bs;

@odata.draft.enabled
entity author
{
    key ID : UUID;
    name : String(100);
    books : Association to many book on books.author = $self;
}

entity book
{
    key ID : UUID;
    description : String(100);
    price : Integer;
    stock : Integer;
    title : String(100);
    author : Association to one author;
}
