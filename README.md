# @mangosoft/lotame

Plugin to integrate Lotame in Ionic

## Install

```bash
npm install @mangosoft/lotame
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`initialize(...)`](#initialize)
* [`getContacts(...)`](#getcontacts)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### initialize(...)

```typescript
initialize(options: { clientId: string; }) => Promise<IGenericResult>
```

| Param         | Type                               |
| ------------- | ---------------------------------- |
| **`options`** | <code>{ clientId: string; }</code> |

**Returns:** <code>Promise&lt;<a href="#igenericresult">IGenericResult</a>&gt;</code>

--------------------


### getContacts(...)

```typescript
getContacts(filter: string) => Promise<{ results: any[]; }>
```

| Param        | Type                |
| ------------ | ------------------- |
| **`filter`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ results: any[]; }&gt;</code>

--------------------


### Interfaces


#### IGenericResult

| Prop          | Type                |
| ------------- | ------------------- |
| **`message`** | <code>string</code> |

</docgen-api>
