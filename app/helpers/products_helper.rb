module ProductsHelper
    def parseRow(row)
        row["price"] = row["price"].tr('$', '')
        if row["promo"]
          row["promo"] = row["promo"].tr('$', '')
        end
        if row["tax"] == 'Y'
          row["tax"] = true
        elsif row["tax"] == 'N'
          row["tax"] = false
        end
        row
    end
end
